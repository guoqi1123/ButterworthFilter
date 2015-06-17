clear all;
close all;
clc;
I = imread('deblur1.png');
[xx,yy,zz] = size(I);
if zz ~= 1
    I = rgb2gray(I);
end
o_f = fftshift(fft2(I));
subplot(2,2,1);imshow(uint8(abs(o_f) ./ max(max(max(abs(o_f)))) * 256));title('origin freq');
I = imnoise(I,'salt & pepper');
subplot(2,2,2);imshow(I);
title('origin');
g = fft2(I);
g = fftshift(g);
[M,N,O] = size(g);
h = zeros(M,N,O); 
result = zeros(M,N,O);
nn = getorder(1.1);

minnum = min(min(g));
log_I = log(g - minnum + 1);
d0 = fun1(log_I,0.2);

m = fix(M/2);n = fix(N/2);
for i = 1:M
    for j = 1:N
        d = sqrt((i - m)^2 + (j - n)^2);
        for k = 1:O
        h(i,j,k) = 1/(1+0.414*(d/d0)^(2*nn));
        result(i,j,k) = h(i,j,k) * g(i,j,k);
        end
    end
end
result = ifftshift(result);
j2 = ifft2(result);
j3 = uint8(real(j2));
subplot(2,2,3);imshow(j3);
title('wc = 100Hz');
subplot(2,2,4);imshow(uint8(h .* 256));title('filter');