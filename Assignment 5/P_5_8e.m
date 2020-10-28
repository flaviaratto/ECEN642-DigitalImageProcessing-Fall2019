clc; clear all;
f=imread('boy.tif');
subplot(1,3,1); imshow(f); title("Original Image")
[m,n]=size(f); P=2*m;  Q=2*n; %Setting filter size for padded image
H=motionBlurTF4e(P,Q,0.1,-0.1,1);

%filtering the image f with H
f=double(f);
f1=intScaling4e(f,"full","floating"); %Scaling input
output=dftFiltering4e(f1,H,"zeros",""); %Zero padding original image
subplot(1,3,2)
imshow(output,[])
title("Blurring original padded image with H")

K=0.5*10^-3;
W=pWienerTF4e(H,K,P,Q);
%output=intScaling4e(output,"full","floating"); %Scaling input
output2=dftFiltering4e(output,W,"none",""); %No padding
subplot(1,3,3)
imshow(output2(1:m,1:n),[]) %Cropped output
title("Restored image with W")