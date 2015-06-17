clear all;
close all;
clc;
OrignalImg = imread('deblur1.png');
OrignalImg = rgb2gray(OrignalImg);
figure;
subplot(2,2,1);
imshow(OrignalImg);
title('OrignalImg');

Dis = fft2(OrignalImg,size(OrignalImg,1),size(OrignalImg,2));
Dis = fftshift(Dis);
pyy = Dis.*conj(Dis)/(size(OrignalImg,1)*size(OrignalImg,2));
minnum = min(min(pyy));

pyy = log(pyy - minnum + 1);
maxnum = max(max(pyy));
minnum = min(min(pyy));
pyy = (pyy - minnum)./(maxnum - minnum) * 254 + 1;
subplot(2,2,2);
pyy = uint8(pyy);
imshow(pyy);
title('freq');

[x_size,y_size] = size(pyy);
pyy_d = double(pyy);
para = lsqcurvefit(@fun,[pyy_d(ceil(x_size/2),ceil(y_size/2)+1),pyy_d(ceil(x_size/2),y_size)]',1:y_size-ceil(y_size/2) + 1,pyy_d(ceil(x_size/2),ceil(y_size/2):y_size));
%para = lsqcurvefit(@fun,[pyy_d(ceil(x_size/2),ceil(y_size/2)+1)]',1:y_size-ceil(y_size/2) + 1,pyy_d(ceil(x_size/2),ceil(y_size/2):y_size));
y = fun(para,1:(y_size-ceil(y_size/2) + 1));
figure;
plot(ceil(y_size/2):y_size,y);
hold;plot(1:y_size,pyy(ceil(x_size/2),1:x_size));
title('origin');

figure;
OrignalImg = imnoise(OrignalImg,'gaussian',0.01,0.01);
Dis = fft2(OrignalImg,size(OrignalImg,1),size(OrignalImg,2));
Dis = fftshift(Dis);
pyy = Dis.*conj(Dis)/(size(OrignalImg,1)*size(OrignalImg,2));
minnum = min(min(pyy));
pyy = log(pyy - minnum + 1);
maxnum = max(max(pyy));
minnum = min(min(pyy));
pyy = (pyy - minnum)./(maxnum - minnum) * 254 + 1;
subplot(2,2,3);
pyy = uint8(pyy);
imshow(pyy);
title('noise freq');


pyy_d = double(pyy);
para = lsqcurvefit(@fun,[pyy_d(ceil(x_size/2),ceil(y_size/2)+1),pyy_d(ceil(x_size/2),y_size)]',1:y_size-ceil(y_size/2) + 1,pyy_d(ceil(x_size/2),ceil(y_size/2):y_size));
%para = lsqcurvefit(@fun,[pyy_d(ceil(x_size/2),ceil(y_size/2)+1)]',1:y_size-ceil(y_size/2) + 1,pyy_d(ceil(x_size/2),ceil(y_size/2):y_size));
y = fun(para,1:(y_size-ceil(y_size/2) + 1));
figure;
plot(ceil(y_size/2):y_size,y);
hold;plot(1:x_size,pyy(ceil(x_size/2),1:y_size));
title('noise');