f=imread('girl.tif');
%Origin%
origin_value=pixVal4e(f,1,1);
disp("The pixel value at origin is "+origin_value)
%Middle%
[x,y]=size(f);
x=floor(x/2);
y=floor(y/2);
middle_value=pixVal4e(f,x,y);
disp("The pixel value at the middle of the image is "+middle_value)