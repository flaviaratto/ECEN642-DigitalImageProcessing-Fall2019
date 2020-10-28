function H = laplacianTF4e(P,Q)
    for u=1:P
        for v=1:Q
            d=sqrt(((u-ceil(P/2))^2)+((v-ceil(Q/2))^2));
            H(u,v)=((-4)*((pi)^2)*(d^2));
        end
    end