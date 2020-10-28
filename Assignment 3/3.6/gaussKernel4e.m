function w = gaussKernel4e(m,sig,K)
%To default K to 1 if third argument is not passed
if nargin ~=3
     K=1;
     disp("K= "+K)
end
w=zeros(m,m);
c=(m+1)/2;
for i=1:m
    for j=1:m
        x_sq=(i-c)^2;
        y_sq=(j-c)^2;
        r_sq= x_sq + y_sq;
        p=2*(sig^2);
        w(i,j)=K*exp(-r_sq/p);
    end
end
%Normalizing
sum_w=sum(sum(w));
w=(1/sum_w)*w;


        