f=imread('spillway-dark.tif');
[r,c]=size(f);
M0=min(min(f));
M1=max(max(f));
K=1;
double g;
for i=1:r
    for j=1:c
        g(i,j)=f(i,j)-M0;
        h(i,j)=K(g(i,j)/M1);
    end
end