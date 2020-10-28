clc;
clear all;
f=imread('blurry-moon.tif');
subplot(2,2,1)
imshow(f)
title("Original Image")
f=double(f);
ip=intScaling4e(f,"full","floating");%Scailing Input image

[m,n]=size(f);
P=2*m;  Q=2*n;
H=lpFilterTF4e("gaussian",P,Q,60); %Creating Gaussian LPF

%filtering the image f with H
output=dftFiltering4e(f,H,"","yes");
subplot(2,2,2)
imshow(output)
title("Gaussian Low pass filtered image")

%op=intScaling4e(output,"full","floating"); %Scaling LPF image

mask=ip-output; %Subtract
subplot(2,2,3)
imshow(mask)
title("Mask")

d=ip+(2.5*mask);
subplot(2,2,4)
imshow(d)
title("Sharpened Image using High Boost Filtering")