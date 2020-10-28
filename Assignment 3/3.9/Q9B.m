clc;
clear all;
f=imread("checkerboard1024-shaded.tif");
subplot(1,3,1);
imshow(f);%original image
title("Original Iimage")
f=double(f);
[f1,f2]=size(f);
IP_image = intScaling4e(f,"full","floating");

%Creating the Sobel Kernels
w1=[-1, -2, -1; 0, 0, 0; 1, 2, 1]; 
w2=[-1, 0, 1; -2, 0, 2; -1, 0, 1];

%Applying sobel kernels to the original image
filtered_output1=conv2(IP_image,w1);
filtered_output2=conv2(IP_image,w2);

%Removing zero padding
%[d1,d2]=size(filtered_output1);
m=3;
c1=(m-1)/2;
output1=filtered_output1(c1+1:end-c1,c1+1:end-c1);
output2=filtered_output2(c1+1:end-c1,c1+1:end-c1);

d1 = intScaling4e(output1,"full","floating");
subplot(1,3,2);
imshow(d1);%Sharpened Image using Sobel Kernel 1
title("Sharpened Image filtered using Sobel Kernel 1")

d2 = intScaling4e(output2,"full","floating");
subplot(1,3,3);
imshow(d2);%Sharpened Image using Sobel Kernel 2
title("Sharpened Image filtered using Sobel Kernel 2")
