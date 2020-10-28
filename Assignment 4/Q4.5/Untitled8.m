%Exp 5 Low pass filtering
%Butterworth low pass filter
clc;
clear all;
close all;
a=imread('testpattern512.tif');
subplot(2,4,1);
imshow(a);%original image

x1=fft2(a);%applying fourier transform to original image
subplot(2,4,2);
imshow(log(1+abs(x1)),[]);%image after applying fourier transform to original

[row col]=size(a);%size of image
%Pre processing
for i=1:row
    for j=1:col
        b(i,j)=((-1)^(i+j))*a(i,j);
    end
end
subplot(2,4,3);
imshow(b);%image after Pre processing


x=fft2(b);%applying fourier transform to pre processed image
subplot(2,4,4);
imshow(log(1+abs(x)),[]);%image after applying fourier transform to pre processed image
d1=32;%initializing cut off
%generating filter function
for i=1:row
    for j=1:col
        d=sqrt(((i-row/2)^2)+((j-col/2)^2));
        h(i,j)=1/(1+(d/d1)^4);
      
    end
end
subplot(2,4,5);
imshow(h);%displays filter function

F=x.*h;%applying filter function 
subplot(2,4,6);
imshow(log(1+abs(F)),[]);%image after applying filter function
f=ifft2(F);%applying inverse fourier transform
%post processing
for i=1:row
    for j=1:col
        g(i,j)=((-1)^(i+j))*f(i,j);
    end
end
%subplot(2,4,7);
figure(2)
imshow(g,[]); %Enhanced image