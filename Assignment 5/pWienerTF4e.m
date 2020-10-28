function W = pWienerTF4e(H,K,P,Q)
for i=1:P
    for j=1:Q
        h=abs(H(i,j));
        W(i,j)=(1/H(i,j))*((h^2)/((h^2)+K));
    end
end

