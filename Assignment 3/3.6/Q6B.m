clc;
clear all;
f=zeros(512,512);
f(256,256)=1;
f=double(f);
[f1,f2]=size(f);
%Using a size equal to 6sigma x 6sigma for the kernel, we get the value for 
%sigma and m so that the maximum value of the filtered image is
%approximately equal to 0.005 of the maximum of the original image
output = gaussKernel4e(35,5.8);
disp("Maximum value in the output image = " +max(max(output)))

%Applying gaussian kernel to the original image
filtered_output=conv2(f,output);

%Removing zero padding
[d1,d2]=size(filtered_output);
m=35;
c1=(m-1)/2;
filtered_output2=filtered_output(c1+1:end-c1,c1+1:end-c1);

%Scaling
d = intScaling4e(filtered_output2,"full","floating");
imshow(d)