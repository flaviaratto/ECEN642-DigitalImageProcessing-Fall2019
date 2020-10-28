clc;
clear all;
F=imread("numbers.tif");
subplot(1,3,1); imshow(F); title("Original Image")
%impixelinfo

B=ones(35,1);
E=imerode(F,B); %Eroded image and also Marker for Reconstruction
subplot(1,3,2); imshow(E)
title("Eroded image and Marker for Reconstruction")

MARKER = E;
MASK=F; %MARKER Image before erosion

[OR,k]= morphoOpenbyRecon4e(MARKER, MASK);
subplot(1,3,3); imshow(OR)
title("Reconstruction Image")