clc;
clear all;
f=imread("hidden-symbols.tif");
subplot(1,2,1); %Original Image
imshow(f);
title("Original Image")

output = localhistEqual4e(f,3,3);

subplot(1,2,2); %Local Histogram Equalized Image
imshow(uint8(output));
title("Image after local Histogram Equalization")