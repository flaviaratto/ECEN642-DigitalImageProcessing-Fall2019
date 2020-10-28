f=imread('girl.tif');
[M,N]=size(f);
[rUL,cUL,rLR,cLR]= cursorValues4e(f);
mask=mask4e(M,N,rUL,cUL,rLR,cLR);
R1=imArithmetic4e(f,mask,"multiply");
R1=uint8(R1);
imshow(R1)

