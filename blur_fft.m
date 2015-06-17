I = imread('deblur1.png');
LEN = 31;
THETA = 11;
PSF = fspecial('motion',LEN,THETA);
Blurred = imfilter(I,PSF,'circular','conv');
I_fft = fft2(I);
Blur_fft = fft2(Blurred);
 figure;imshow(I_fft);title('origin');figure;imshow(Blur_fft);title('blur');