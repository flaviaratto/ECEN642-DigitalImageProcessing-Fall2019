clc; clear all;
f=imread('book-cover-blurred.tif');
subplot(1,3,1); imshow(f); title("Blurred Image")
[m,n]=size(f); P=m;  Q=n; %setting filter size

H=motionBlurTF4e(P,Q,0.1,0.1,1.0);
K=0.5*10^-3;
W=pWienerTF4e(H,K,P,Q);

f=double(f);
f1=intScaling4e(f,"default","floating"); %Scaling input
output=dftFiltering4e(f1,W,"none",""); %No padding
subplot(1,3,2); imshow(output,[]); title("Restored image with W")

%Original image for comparision
o=imread('Fig0526(a)(original_DIP).tif');
subplot(1,3,3); imshow(o); title("Original image")
