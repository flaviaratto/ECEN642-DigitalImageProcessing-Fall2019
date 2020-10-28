f=imread("rose1024.tif");
[r,c]=size(f);
rUL=floor(r/4);
cUL=floor(c/4);
rLR=rUL+(r/2);
cLR=cUL+(c/2);
R1=mask4e(r,c,rUL,cUL,rLR,cLR);
R1=uint8(R1);
x=(rLR-rUL+1)*(cLR-cUL+1);
y=sum(sum(R1));

if x==y
    disp("The number of 1-valued elements in the mask is correct");
end

figure(1)
imshow(f)
g=R1.*f;
figure(2)
imshow(g)