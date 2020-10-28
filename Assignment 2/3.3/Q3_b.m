clc;
clear all;
f=imread("spillway-dark.tif");

output = histEqual4e(f);
output2 = intXform4e(f,"gamma",0.6);

subplot(1,3,1); %Original Image
imshow(f);
title("Original Image")
subplot(1,3,2); %Histogram Equalized Image
imshow(uint8(output));
title("Image after Histogram Equalization")
subplot(1,3,3); %Gamma Transformed Image
imshow(output2);
title("Image after Gamma Transformation")