function m=mask4e(M,N,rUL,cUL,rLR,cLR)
m=zeros(M,N);
% if ((rLR-rUL+1)*(cLR-cUL+1))>(M*N)
%     disp ("Error: The specified region of 1s exceed the dimensions of MxN region")
%     terminate;
% end
% if rUL>M || cUL>N || rLR>M || cLR>N
%     fprintf ("Error Message")
% end

for i=rUL:rLR
    for j=cUL:cLR
        m(i,j)=1;
    end
end
    