clc;
clear all;
f=imread("checkerboard1024-shaded.tif");
subplot(2,2,1);
imshow(f);%original image
title("Original Iimage")
f=double(f);
[f1,f2]=size(f);
IP_image = intScaling4e(f,"full","floating");

%Creating the Sobel Kernels
w1=[-1, -2, -1; 0, 0, 0; 1, 2, 1]; 
w2=[-1, 0, 1; -2, 0, 2; -1, 0, 1];

%Applying sobel kernels to the original image
filtered_output1=conv2(IP_image,w1);
filtered_output2=conv2(IP_image,w2);

%Removing zero padding
m=3;
c1=(m-1)/2;
output1=filtered_output1(c1+1:end-c1,c1+1:end-c1);
output2=filtered_output2(c1+1:end-c1,c1+1:end-c1);

d1 = intScaling4e(output1,"full","floating");
subplot(2,2,2);
imshow(d1);%Sharpened Image using Sobel Kernel 1
title("Sharpened Image filtered using Sobel Kernel 1")

d2 = intScaling4e(output2,"full","floating");
subplot(2,2,3);
imshow(d2);%Sharpened Image using Sobel Kernel 2
title("Sharpened Image filtered using Sobel Kernel 2")

%Computing magnitude
for p=1:f1
    for q=1:f2
        Gx=d1(p,q);
        Gy=d2(p,q);
        M(p,q)=sqrt(Gx^2 + Gy^2);
    end
end

N=intScaling4e(M,"full","floating");
subplot(2,2,4);
imshow(N)
title("Magnitude of the Gradient image")
        