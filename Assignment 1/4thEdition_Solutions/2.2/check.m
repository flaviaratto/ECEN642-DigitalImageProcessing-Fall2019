f=imread('girl.tif');
imshow(f)
[r0,c0]=ginput(1);
r=round(r0);
c=round(c0);
v=pixelVal4e(r,c);