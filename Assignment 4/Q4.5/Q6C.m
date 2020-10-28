clc;
clear all;
f=imread('checkerboard1024-shaded.tif');
subplot(1,3,1)
imshow(f)
title("Original Image")
f=double(f);
ip=intScaling4e(f,"full","floating");%Scailing Input image

[m,n]=size(f);
P=2*m;  Q=2*n;
H=lpFilterTF4e("gaussian",P,Q,6); %Creating Gaussian LPF

%filtering the image f with H
output=dftFiltering4e(ip,H,"zeros","yes");
subplot(1,3,2)
imshow(output)
title("Gaussian Low pass filtered image")

d=ip./output; %Shading Correction
subplot(1,3,3)
imshow(d)
title("Shading corrected image")