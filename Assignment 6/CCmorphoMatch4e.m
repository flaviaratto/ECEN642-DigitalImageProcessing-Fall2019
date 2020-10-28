function [S,S1,S2] = morphoMatch4e(I,B,padval,mode)
[M,N]=size(I);  %Size of binary image
[m,n]=size(B);  %Size of structuring element

p1=floor((m-1)/2);
p2=floor((n-1)/2);
% p1=m;
% p2=n;
Ip=padarray(I,[p1,p2],padval,'both'); %Padding binary image
[Mp,Np]=size(Ip); %Size of padded binary image
S2=Ip;
for i=1:M
    for j=1:N
        for p=1:m
            for q=1:n
                B1(p,q)=Ip(i+p-1,j+q-1);
                if B(p,q)==0
                    B1(p,q)=B(p,q);
                end
                if B(p,q)==1
                    B1(p,q)=B(p,q);
                end
            end
            %disp(B1)
        end
        sumB=sum(sum(B1));
        sumIp=sum(sum(Ip(i:i+m-1,j:j+n-1)));
        disp(sumIp)
        S1(i+p1,j+p2)=sum(sum(B1.*Ip(i:i+m-1,j:j+n-1)));
        disp(S1(i+p1,j+p2))
        S2(i+p1,j+p2)=0.5; 
        if S1(i+p1,j+p2)==0
            S2(i+p1,j+p2)=0;
        end 
        if S1(i+p1,j+p2)==sumB && S1(i+p1,j+p2)==sumIp
            S2(i+p1,j+p2)=1;
        end
    end
end
%disp(S1)
if mode=='full'
    S=S2;
end
if mode=='same'
    S=S2(p1+1:end-p1,p2+1:end-p2);
end
