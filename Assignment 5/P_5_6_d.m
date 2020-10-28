clc;    clear all;
f=imread("cassini-interference.tif");
subplot(2,3,1); imshow(f); title("Original image")
[m,n]=size(f);
P=m;  Q=n;  %Setting size of H
H=notchReject4e("rectangular",P,Q,[5,"vertical",5],[P/2,Q/2]);
subplot(2,3,3); imshow(H); title("Filter Transfer function")

%filtering the image f with H
f=double(f);
f1=intScaling4e(f,"default","floating"); %Scaling input
output=dftFiltering4e(f1,H,"none","yes");%No padding
subplot(2,3,4); imshow(output); title("Processed image")

%Getting Interferrence pattern
HNP=1-H;
subplot(2,3,5); imshow(HNP)
title("Notch pass filter transfer function")
IF_output=dftFiltering4e(f1,HNP,"none","yes");
subplot(2,3,6); imshow(IF_output); title("Inteferrence pattern")