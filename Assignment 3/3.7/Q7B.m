clc;
clear all;
l=imread("testpattern1024.tif");
subplot(2,2,1);
imshow(l);%original image
title("Original Iimage")

f=255-l;
subplot(2,2,2);
imshow(f);%Inverted image
title("Negative of the Original Iimage")

f=double(f);
[f1,f2]=size(f);
%After seeing intensity values of the image f, 
%I figured that the large square on the top right 
%is of a size equal to approximately 121x121 pixels
%So I use a gaussian kernel of size 121x121 
%to Low pass filter the image
%Sigma is taken as 20 from 6sigma X 6sigma
output = gaussKernel4e(121,20,1);

%Applying gaussian kernel to the original image
filtered_output=conv2(f,output);

%Removing zero padding and scaling
[d1,d2]=size(filtered_output);
m=121;
c1=(m-1)/2;
filtered_output2=filtered_output(c1+1:end-c1,c1+1:end-c1);
d = intScaling4e(filtered_output2,"full","floating");
subplot(2,2,3);
imshow(d);%LPF image
title("Gaussian Low Pass Filtered image")

%Thresholding
for p=1:f1
    for q=1:f2
        if(d(p,q)<0.9)
        d(p,q)=0;
        end
        if(d(p,q)>=0.9)
            d(p,q)=1;
        end
    end
end
subplot(2,2,4);
imshow(d);%Image after thresholding
title("Image thresholded to obtain a part of the top right square")