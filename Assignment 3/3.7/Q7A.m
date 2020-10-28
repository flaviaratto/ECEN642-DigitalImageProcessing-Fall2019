clc;
clear all;
f=imread("testpattern1024.tif");
f=double(f);
[f1,f2]=size(f);
%Using a size equal to 6sigma x 6sigma for the kernel, we set the value for
%m and get the value of sigma so that the large letter "a" in the image is
%barely readable and other letters are not
output = gaussKernel4e(151,25,1);

%Applying gaussian kernel to the original image
filtered_output=conv2(f,output);

%Removing zero padding
[d1,d2]=size(filtered_output);
m=151;
c1=(m-1)/2;
filtered_output2=filtered_output(c1+1:end-c1,c1+1:end-c1);

%Scaling
d = intScaling4e(filtered_output2,"full","floating");
imshow(d)