I=imread('deblur1.png');  
[xx,yy,zz] = size(I);
if zz ~= 1
    I = rgb2gray(I);
end
J2=imnoise(I,'gaussian',0,0.01); 
J=imnoise(I,'salt & pepper'); 
J1=imnoise(I,'speckle'); 




%h=ones(3,3)/9;%??3*3??1?? 

%B=conv2(J,h);%???? 

K2=filter2(fspecial('average',3),J)/255; %?????????3 

K= medfilt2(J);%??????????medfilt2????????????? 

K1=wiener2(J,[3 3]); %????????????????     

subplot(2,3,1);imshow(I); 

title('origin'); 

subplot(2,3,2);imshow(J); 

title('noise'); 

subplot(2,3,3);imshow(K2); 

title('aver'); 

subplot(2,3,4);imshow(K); 

title('med'); 

subplot(2,3,5);imshow(K1); 

title('weiner'); 
