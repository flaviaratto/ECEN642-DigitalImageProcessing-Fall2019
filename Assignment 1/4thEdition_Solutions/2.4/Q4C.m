f=imread('spillway-dark.tif');
f=double(f);
R1=intScaling4e(f,"full","floating");
imshow(R1)