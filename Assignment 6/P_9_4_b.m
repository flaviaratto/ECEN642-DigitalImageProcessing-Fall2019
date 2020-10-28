clc;
clear all;
%Creating Fig 9.13(a)
I=zeros(14,18); I(3:9,3:7)=1;
I(8:12,9:13)=1; I(4:6,15:17)=1;
subplot(1,2,1)
imshow(I)
title("Original Image")
%Creating SE
B=zeros(7,7);   B(2:6,2:6)=1;

mode='same';
padval=1;
H=morphoHitmiss4e(I,B,padval,mode);
subplot(1,2,2)
imshow(H)
title("Resultant Image")