clc;
clear all;
f=imread("spillway-dark.tif");

output=intXform4e(f,"log",0);

subplot(1,2,1); %Original Image
imshow(f);
title("Original Image")
subplot(1,2,2); %Log Transformed Image
imshow(output);
title("Image after Log Transformation")