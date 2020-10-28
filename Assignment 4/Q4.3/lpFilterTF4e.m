function H = lpFilterTF4e(type,P,Q,param)

if type=="ideal"
    D0=param;
    for u=1:P
        for v=1:Q
            d=sqrt(((u-ceil(P/2))^2)+((v-ceil(Q/2))^2));
            if d <=D0
                H(u,v)=1;
            else
                H(u,v)=0;
            end
        end
    end
end

if type=="gaussian"
    D0=param;
    for u=1:P
        for v=1:Q
            d=sqrt(((u-ceil(P/2))^2)+((v-ceil(Q/2))^2));
            H(u,v)=exp(-(d^2)/(2*(D0^2)));
        end
    end
end

if type=="butterworth"
    D0=param(1,1);
    n=param(1,2);
    for u=1:P
        for v=1:Q
            d=sqrt(((u-ceil(P/2))^2)+((v-ceil(Q/2))^2));
            H(u,v)=(1+((d/D0)^(2*n)))^(-1);
        end
    end
end