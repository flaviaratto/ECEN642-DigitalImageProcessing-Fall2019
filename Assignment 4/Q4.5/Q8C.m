clc;
clear all;
f=imread('blurry-moon.tif');
subplot(1,3,1)
imshow(f)
title("Original Image")
f=double(f);
ip=intScaling4e(f,"full","floating");   %Scaled input image

[m,n]=size(f);
P=2*m;  Q=2*n;
H=laplacianTF4e(P,Q); %Creating Laplacian LPF

%filtering the image f with H
output=dftFiltering4e(ip,H,"","no");
subplot(1,3,2)
imshow(output)
title("Laplacian High pass filtered image")
max1=max((max(output)));
o_scaled = output/max1; %Normalized output

d=ip+((-1)*o_scaled);
subplot(1,3,3)
imshow(d)
title("Laplacian Sharpened image")