clc;
clear all;
f=imread("spillway-dark.tif");

output=intXform4e(f,"gamma",2);

subplot(1,2,1); %Original Image
imshow(f);
title("Original Image")
subplot(1,2,2); %Gamma Transformed Image
imshow(output);
title("Image after Gamma Transformation")