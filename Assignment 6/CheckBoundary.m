clc;
clear all;
I=ones(5,10);
I(1:2,4)=0;
I(1:2,10)=0;
%imshow(I)
B=strel('rectangle',[3 3]);
%imshow(B)
BD=morphoBoundary4e(I,B);
% figure(1)
%imshow(BD)
