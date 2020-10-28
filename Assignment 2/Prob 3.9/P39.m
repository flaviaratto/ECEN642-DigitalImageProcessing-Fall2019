%Histogram Equalization
clc;
clear;
a=imread('Fig0316(2)(2nd_from_top).tif');
subplot(1,3,1);
imshow(a);%original image
title("Original Iimage")

for l=1:2 % For performing histogram equalization twice
    
[row,col]=size(a); %size of image
c=zeros(1,256); %row of zeroes
rk=0:255;
pdf=zeros(1,256);
cdf=zeros(1,256);
r=zeros(1,256);
n=zeros(1,256);
for x=1:row
     for y=1:col
          temp=a(x,y)+1;    %+1 is added because array cannot take 0 value
          c(temp)=c(temp)+1;
     end
end

for temp=1:256 
      pdf(temp)=c(temp)/(row*col); %calculate pdf
end

cdf(1)=pdf(1);

for temp=2:256
     cdf(temp)=(pdf(temp)+cdf(temp-1)); %calculate cdf
end

for temp=1:256 
      r(temp)=round(cdf(temp)*255); %new value
end

%new value
for x=1:row
    for y=1:col
        temp=a(x,y)+1;
        b(x,y)=r(temp);
    end            
end
for x=1:row
    for y=1:col
        temp=b(x,y)+1;
        n(temp)=n(temp)+1; 
    end
end

subplot(1,3,l+1); %To display image after histogram equalization
imshow(uint8(b));
title("Image after "+l+" pass of histogram equalization")
a=b;% to set 'a' to the histogram equalized image after 1st pass
end


