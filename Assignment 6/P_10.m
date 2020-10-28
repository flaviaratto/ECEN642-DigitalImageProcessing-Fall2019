clc;
clear all;
f=imread("elliptical-blobs-small.tif"); %Mask
subplot(2,2,1)
imshow(f)
title("Original Image")

SE = strel('disk',6);
O=imerode(f,SE);    %Marker
subplot(2,2,2)
imshow(O)
title("Eroded Image")

[OR,k]= morphoOpenbyRecon4e(O,f);
subplot(2,2,3)
imshow(OR)
title("Resultant Image")