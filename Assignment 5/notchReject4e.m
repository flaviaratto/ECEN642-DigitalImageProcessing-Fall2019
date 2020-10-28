function H=notchReject4e(type,M,N,param,C)
ux=C(1,1);  vx=C(1,2);  %Notch Location
if type=="ideal"
    D0=param;
    for u=1:M
        for v=1:N
            d1=sqrt(((u-floor(M/2)-ux)^2)+((v-floor(N/2)-vx)^2));
            d2=sqrt(((u-floor(M/2)+ux)^2)+((v-floor(N/2)+vx)^2));
            if d1 <=D0 || d2<=D0
                H(u,v)=0;
            else
                H(u,v)=1;
            end
        end
    end
end

if type=="gaussian"
    D0=param;
    for u=1:M
        for v=1:N
            d1=sqrt(((u-ceil(M/2)-ux)^2)+((v-ceil(N/2)-vx)^2));
            H1(u,v)=1-(exp(-(d1^2)/(2*(D0^2))));
            d2=sqrt(((u-ceil(M/2)+ux)^2)+((v-ceil(N/2)+vx)^2));
            H2(u,v)=1-(exp(-(d2^2)/(2*(D0^2))));
            H(u,v)=H1(u,v)*H2(u,v);
        end
    end
end

if type=="butterworth"
    D0=param(1,1);
    n=param(1,2);
    for u=1:M
        for v=1:N
            d1=sqrt(((u-ceil(M/2)-ux)^2)+((v-ceil(N/2)-vx)^2));
            H1(u,v)=(1+((D0/d1)^(2*n)))^(-1);
            d2=sqrt(((u-ceil(M/2)+ux)^2)+((v-ceil(N/2)+vx)^2));
            H2(u,v)=(1+((D0/d2)^(2*n)))^(-1);
            H(u,v)=H1(u,v)*H2(u,v);
        end
    end
end

if type=="rectangular"
    H=ones(M,N);
    D0_x=param(1,1);%Offset distance
    d=str2num(D0_x);
    orient=param(1,2);%Offset direction
    w1=param(1,3);%Width
    w=str2num(w1);  w=floor(w/2);
    if orient=="horizontal"
        p=(floor(N/2)-d);   %Starting point of notch
        q=(floor(N/2)+d);   %End point of notch
        H(ux-w:ux+w,:)=0;
        H(ux-w:ux+w,p:q)=1;
    end
    if orient=="vertical"
        p=(floor(M/2)-d);   %Starting point of notch
        q=(floor(M/2)+d);   %End point of notch
        H(:,vx-w:vx+w)=0;
        H(p:q,vx-w:vx+w)=1;
    end  
end