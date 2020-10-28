clc;
clear all;
f1=fopen('\\toaster\homes\f\l\flaviaratto\nt\AccountSettings\Desktop\DIP Assignment\Assignment 3\3.10\lpkernel1D_2.txt','r');
f=fscanf(f1,['%f' ',']);
g=transpose(f);

%Computing the 2D low pass Kernel and converting it into High pass
b=f.*g;
%Creating an impulse mask
[b1,b2]=size(b);
p=ceil((b1-1)/2);
q=ceil((b2-1)/2);
v=zeros(b1,b2);
v(p,q)=1;
%Creating a High pass mask from low pass mask
hp_mask=v-b;
[hp1,hp2]=size(hp_mask);

%Filtering
ip=imread("testpattern1024.tif");
subplot(1,3,1)
imshow(ip)
title("Original Image")
ip1=intScaling4e(ip,"full","floating");
result = conv2(ip1,hp_mask);

%Removing zero padding
[d1,d2]=size(result);
m=hp1;
c1=ceil((m-1)/2);
result_stripped=result(c1+1:end-c1,c1+1:end-c1);
%Scaling
result_scaled = intScaling4e(result_stripped,"full","floating");
subplot(1,3,2)
imshow(result_stripped)
title("High Pass Filtered Image (unscaled)")
subplot(1,3,3)
imshow(result_scaled)
title("High Pass Filtered Image (scaled)")