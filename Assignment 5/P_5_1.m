clc;
clear all;
f=imread("book-cover-gaussian.tif");
g=f(1:180,1:30); %Extracted part of image
k=imhist(g); %Histogram of extracted part
[r,c]=size(g);

%Computing Mean
mean=0;
for i=1:size(k)
    k(i)=k(i)/(r*c);
    mean=mean+(k(i)*i);
end
disp("Mean= "+mean)

%Computing Standard Deviation
var=0;
for i=1:size(k)
    k(i)=k(i)/(r*c);
    var=var+(((i-mean)^2)*k(i));
end
disp("Standard Deviation= "+sqrt(var))
