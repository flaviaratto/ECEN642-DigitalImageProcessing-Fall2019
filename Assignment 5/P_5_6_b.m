clc;    clear all;
f=imread("astronaut-interference.tif");
subplot(2,3,1);imshow(f); title("Original image")
[m,n]=size(f);
P=m;  Q=n;%Setting size of H
H=notchReject4e("gaussian",P,Q,5,[25,25]);  
subplot(2,3,3); imshow(H); title("Filter Transfer function")

%filtering the image f with H
f=double(f);
f1=intScaling4e(f,"default","floating"); %Scaling input
output=dftFiltering4e(f1,H,"none","yes");%None is without padding
subplot(2,3,4); imshow(output); title("Processed image")

%Getting Interferrence pattern
HNP=1-H;
IF_output=dftFiltering4e(f1,HNP,"none","yes");
subplot(2,3,5); imshow(IF_output); title("Inteferrence pattern")