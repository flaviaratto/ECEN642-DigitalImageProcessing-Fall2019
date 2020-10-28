clc;
clear all;
I=imread("testpattern512-binary.tif");
[y1,y2]=size(I); 
subplot(2,2,1); imshow(I);  title("Original Image")

G=zeros(10,10);     %SE for finding the top left square
F=morphoHitmiss4e(I,G,1,'same');

%SE for removing the other hits
G2 = zeros(50,50);  G2(25,25)=1;
[z1,z2]=size(G2); 
F2=morphoHitmiss4e(F,G2,1,'same');  %Marker for Geodesic Dilation

subplot(2,2,2); imshow(F2)
title("Output of Hit and Miss Transform F2 to get the desired square")

B=ones(3,3);
padval=1;
%Padding Mask for geodesic dilation 
Gp=padarray(G2,[y1-z1,0],padval,'post'); 
Gp=padarray(Gp,[0,y2-z2],padval,'post');

n=5;
DG1=morphoGeoDilate4e(F2,Gp,B,n);
subplot(2,2,3); imshow(DG1)
title("Geodesic Dilation of marker F2 with respect to mask Gp")

subplot(2,2,4)
imshow(imcomplement(DG1))
title("Required Result")
