clc;
clear all;
f=imread('thumbprint.tif');
subplot(1,3,1)
imshow(f)
title("Original Image")

[m,n]=size(f);
P=2*m;  Q=2*n;
H=hpFilterTF4e("butterworth",P,Q,[50,4]); %Creating Butterworth HPF

%filtering the image f with H
f=double(f);
f1=intScaling4e(f,"full","floating"); %Scaling input image
output=dftFiltering4e(f1,H,"","no"); %Using option of no scaling of output
subplot(1,3,2)
imshow(output)
title("Butterworth High pass filtered image")

for i=1:m
    for j=1:n
        if output(i,j)<=0
            output(i,j)=0;
        end
        if output(i,j)>0
            output(i,j)=1;
        end 
    end
end

subplot(1,3,3)
imshow(output)
title("Thresholded image")