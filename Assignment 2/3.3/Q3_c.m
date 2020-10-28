clc;
clear all;
f=imread("hidden-horse.tif");

output = histEqual4e(f);

subplot(1,3,1); %Original Image
imshow(f);
title("Original Image")
subplot(1,3,2); %Histogram Equalized Image
imshow(uint8(output));
title("Image after Histogram Equalization")
subplot(1,3,3); %Histogram of image after histogram equalization
histogram(output); 
title("Histogram of image after histogram equalization")