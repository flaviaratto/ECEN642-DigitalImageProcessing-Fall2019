function H = motionBlurTF4e(P,Q,a,b,T)
for u=1:P
    for v=1:Q
        %Centering
        x=u-ceil(P/2); y=v-ceil(Q/2);
        m=pi*((x*a)+(y*b)+(10^-20)); %Adding a small value for equal cases
        H(u,v)=(T/m)*(sin(m))*(exp(-1j*m));
    end
end