clc;
clear all;
f=imread('testpattern1024.tif');
subplot(1,2,1)
imshow(f)
title("Original Image")

[m,n]=size(f);
P=2*m;  Q=2*n;
H=lpFilterTF4e("gaussian",P,Q,10);

%filtering the image f with H
f=double(f);
f1=intScaling4e(f,"full","floating"); %Scaling input
output=dftFiltering4e(f1,H,"","");
subplot(1,2,2)
imshow(output)
title("Gaussian Low Pass filtered image")