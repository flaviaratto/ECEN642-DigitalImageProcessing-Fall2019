%Pg 351
clc;    clear all;
f=imread("astronaut-interference.tif");
subplot(2,3,1); imshow(f); title("Original image")
[m,n]=size(f);
P=2*m;  Q=2*n;  %Setting size of H due to padding
H=notchReject4e("gaussian",P,Q,10,[50,50]);%Updating Filter values for padding
subplot(2,3,3); imshow(H); title("Filter Transfer function")

%filtering the image f with H
f=double(f);
f1=intScaling4e(f,"default","floating"); %Scaling input
output=dftFiltering4e(f1,H,"zeros","yes");%Filtering with padding
subplot(2,3,4); imshow(output); title("Processed image")

%Getting Interferrence pattern
HNP=1-H;
IF_output=dftFiltering4e(f1,HNP,"zeros","yes");
subplot(2,3,5); imshow(IF_output); title("Inteferrence pattern")