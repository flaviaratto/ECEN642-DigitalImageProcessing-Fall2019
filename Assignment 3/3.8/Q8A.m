clc;
clear all;
f=imread("blurry-moon.tif");
subplot(2,2,1);
imshow(f);%original image
title("Original Iimage")
f=double(f);
[f1,f2]=size(f);
IP_image = intScaling4e(f,"full","floating");
%For the image of size 800x690
%Using a gaussian kernel of size equal to 83x83
%K=1 and sigma=14 
output = gaussKernel4e(83,14,1);

%Applying gaussian kernel to the original image
filtered_output=conv2(IP_image,output);

%Removing zero padding and scaling
[d1,d2]=size(filtered_output);
m=83;
c1=(m-1)/2;
filtered_output2=filtered_output(c1+1:end-c1,c1+1:end-c1);
d = intScaling4e(filtered_output2,"full","floating");
subplot(2,2,2);
imshow(d);%Low pass filtered image
title("Gaussian Kernel Low Pass Filtered Image")

% Subtracting the LPF image from the original and then adding the result to
% the original image to get the sharpened image using unsharp masking
mask = IP_image-d;
subplot(2,2,3);
imshow(mask);%LPF image subtracted from original image --> Mask
title("Mask")

final_result=IP_image+mask;
subplot(2,2,4);
imshow(final_result);%Result
title("Sharpened Image using Unsharp Masking")