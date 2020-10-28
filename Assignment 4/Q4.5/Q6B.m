clc;
clear all;
f1=imread('testpattern1024.tif');
subplot(1,3,1)
imshow(f1)
title("Original Image")
f=255-f1;
[m,n]=size(f);
P=2*m;  Q=2*n;
H=lpFilterTF4e("butterworth",P,Q,[18,2]);

%filtering the image f with H
f=double(f);
f1=intScaling4e(f,"full","floating"); %Scaling input
output=dftFiltering4e(f1,H,"","");
subplot(1,3,2)
imshow(output)
title("Butterworth Low pass filtered image")

for p=1:m
    for q=1:n
        if(output(p,q)<0.9)
        output(p,q)=0;
        end
        if(output(p,q)>=0.9)
            output(p,q)=1;
        end
    end
end
subplot(1,3,3)
imshow(output)
title("Thresholded image")