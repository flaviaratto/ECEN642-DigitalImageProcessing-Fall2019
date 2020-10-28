clc;
clear all;
I=imread("calculator-binary.tif");  %Mask for second round of Geodesic Dilation
[y1,y2]=size(I); 
subplot(2,2,1);  imshow(I); title("Original Image")
G=imread("calculator-binary-upper-arrow.tif");  %Mask for first round of Geodesic Dilation
[z1,z2]=size(G); 
F=morphoHitmiss4e(I,G,1,'same');    %Marker

B=ones(3,3);    %SE
padval=1;
%Padding Mask for geodesic dilation 
Gp=padarray(G,[y1-z1,0],padval,'pre'); 
Gp=padarray(Gp,[0,y2-z2],padval,'post');

n=15;
DG1=morphoGeoDilate4e(F,Gp,B,n);
subplot(2,2,2); imshow(DG1)
title("Geodesic Dilation of marker F with respect to mask - upper arrow - G")

DG2=morphoGeoDilate4e(DG1,I,B,n);
subplot(2,2,3); imshow(DG2)
title("Geodesic Dilation of previous geodesic output with respect to mask - original image - I")

o=I-DG2;
subplot(2,2,4); imshow(o);  title("Final output Image")
