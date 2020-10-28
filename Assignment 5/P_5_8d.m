clc; clear all;
f=imread('boy-blurred.tif');
subplot(1,2,1); imshow(f); title("Blurred Image")
[m,n]=size(f);
P=2*m;  Q=2*n; %Setting filter size for padded image

H=motionBlurTF4e(P,Q,0.1,-0.1,1.0);
K=0.5*10^-3;
W=pWienerTF4e(H,K,P,Q);

f=double(f);
f1=intScaling4e(f,"default","floating"); %Scaling input
output=dftFiltering4e(f1,W,"zeros",""); %With zero padding
subplot(1,2,2)
imshow(output(1:m,1:n),[])
title("Restored image with W")
