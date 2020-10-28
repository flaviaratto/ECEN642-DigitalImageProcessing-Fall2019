clc;
clear all;

f=zeros(512,512);
f(256,256)=1;

%Setting the Kernel to be a laplacian kernel
w=[0, -1, 0; -1, 4, -1; 0, -1, 0];
convolution_result=twodConv4e(f,w);

disp("Result: "+convolution_result)
imshow(convolution_result)