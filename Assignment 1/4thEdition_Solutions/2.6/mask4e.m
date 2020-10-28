function m=mask4e(M,N,rUL,cUL,rLR,cLR)
m=zeros(M,N);
for i=rUL:rLR
    for j=cUL:cLR
        m(i,j)=1;
    end
end
    