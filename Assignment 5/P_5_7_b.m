clc; clear all;
f=imread('boy.tif');
subplot(1,3,1); imshow(f); title("Original Image")
[m,n]=size(f);
P=m;  Q=n;  %Setting transfer function size
H=motionBlurTF4e(P,Q,0.1,0.1,1);
subplot(1,3,2)
imshow(log(1+abs(H)),[])
title("Spectrum of Blurring Transfer function")

%filtering the image f with H
f=double(f);
f1=intScaling4e(f,"default","floating"); %Scaling input
output=dftFiltering4e(f1,H,"none","");  %No padding
subplot(1,3,3)
imshow(output,[])
title("Blurring original image with H")