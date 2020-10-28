clc;
clear all;
f=imread('chestXray.tif');
subplot(2,2,1)
imshow(f)
title("Original Image")

[m,n]=size(f);
P=2*m;  Q=2*n;
H=hpFilterTF4e("gaussian",P,Q,70); %Creating Gaussian HPF

%filtering the image f with H
f=double(f);
f1=intScaling4e(f,"full","floating");   %Scaling input image
output=dftFiltering4e(f1,H,"","yes");
subplot(2,2,2)
imshow(intScaling4e(output,"default","floating"))
title("Gaussian High pass filtered image")

%High Freq Emphasis
k1=0.5; k2=0.75;
H_HF=(k1+(k2*H));
output_HF=dftFiltering4e(f,H_HF,"","yes");
subplot(2,2,3)
o=intScaling4e(output_HF,"default","floating");
imshow(o)
title("High Frequency emphasis filtered image")

%Histogram equalization on the above output
op_hist=histeq(o);
subplot(2,2,4)
imshow(op_hist)
title("Histogram equalization performed on (c)")