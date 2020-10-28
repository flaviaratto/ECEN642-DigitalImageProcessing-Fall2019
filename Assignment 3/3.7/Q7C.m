clc;
clear all;
f=imread("checkerboard1024-shaded.tif");
subplot(1,3,1);
imshow(f);%original image
title("Original Iimage")
f=double(f);
[f1,f2]=size(f);
IP_image = intScaling4e(f,"full","floating");
%For the image of size 1024x1024 and inner suare of size 64x64 pixels
%Using a gaussian kernel of size equal to 256x256 (four times the size
%of the inner squares) for low pass filtering
%K=1 and sigma=64 (equal to the size of the squares)
%This kernel is large enough to blur out the squares

output = gaussKernel4e(256,64,1);

%Applying gaussian kernel to the original image
filtered_output=conv2(IP_image,output);

%Removing zero padding and scaling
[d1,d2]=size(filtered_output);
m=256;
c1=(m-1)/2;
filtered_output2=filtered_output(c1+1:end-c1,c1+1:end-c1);
d = intScaling4e(filtered_output2,"full","floating");
subplot(1,3,2);
imshow(d);%Low pass filtered image
title("Gaussian Kernel Low Pass Filtered Image")

%Dividing original image(IP_image) by low pass filtered image d 
%to get the shading correction done 
final_result = IP_image./d;
subplot(1,3,3);
imshow(final_result);%Result
title("Result of Shading Correction")