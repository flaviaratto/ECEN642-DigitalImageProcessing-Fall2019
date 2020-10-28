clc;
clear all;
f=imread("blurry-moon.tif");
subplot(1,3,1);
imshow(f);%original image
title("Original Iimage")
f=double(f);
[f1,f2]=size(f);
IP_image = intScaling4e(f,"full","floating");
%Creating a Laplacian Kernel
w=[0, -1, 0; -1, 4, -1; 0, -1, 0];  
%Applying Laplacian kernel to the original image
filtered_output=conv2(IP_image,w);

%Removing zero padding
[d1,d2]=size(filtered_output);
m=3;
c1=(m-1)/2;
filtered_output2=filtered_output(c1+1:end-c1,c1+1:end-c1);

result=IP_image+filtered_output2;
d = intScaling4e(result,"full","floating");
subplot(1,3,2);
imshow(d);%Sharpened Image using Laplacian Kernel
title("Sharpened Image using Laplacian Kernel")

%Comparision with image from Project 3.8a
g=imread("Project8a.tif");
subplot(1,3,3);
imshow(g);
title("Sharpened Image using Unsharp masking")