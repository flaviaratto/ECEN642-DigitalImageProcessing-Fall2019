clc;
clear all;
f1=fopen('\\toaster\homes\f\l\flaviaratto\nt\AccountSettings\Desktop\DIP Assignment\Assignment 3\3.10\lpkernel1D_2.txt','r');
f=fscanf(f1,['%f' ',']);
g=transpose(f);

%Computing the 2D Kernel 
w=f.*g;
[w1,w2]=size(w);

%Filtering
ip=imread("testpattern1024.tif");
subplot(1,2,1)
imshow(ip)
title("Original Image")
ip=double(ip);
result = conv2(ip,w);

%Removing zero padding
[d1,d2]=size(result);
m=w1;
c1=ceil((m-1)/2);
result_stripped=result(c1+1:end-c1,c1+1:end-c1);

%Scaling
result_scaled = intScaling4e(result_stripped,"full","floating");

subplot(1,2,2)
imshow(result_scaled)
title("Low Pass Filtered Image")