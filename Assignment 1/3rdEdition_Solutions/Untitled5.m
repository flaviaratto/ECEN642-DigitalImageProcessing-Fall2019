f=imread('Fig0220(a)(chronometer 3692x2812  2pt25 inch 1250 dpi).tif');
[r,c]=size(f);
%Zero Padding
f1=zeros(r+2,c+2);
for i=1:r
    for j=1:c
        f1(i+1,j+1)=f(i,j);
    end
end
[m,n]=size(f1);
for x=1:n
    for y=1:m
        f2(x+1,y+1)=f(x,y);
    end
end
