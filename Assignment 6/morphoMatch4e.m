function S = morphoMatch4e(I,B,padval,mode)
[M,N]=size(I);  %Size of binary image
[m,n]=size(B);  %Size of structuring element

p1=m;   p2=n;   %For Padding
Ip=padarray(I,[p1,p2],padval,'both'); %Padding binary image

S1=Ip;  %Initializing
for i=1:M
    for j=1:N
        %For loop for setting the dont care values of B as per I
        for p=1:m
            for q=1:n
                B1(p,q)=Ip(i+p-1,j+q-1);    %New Temp SE matrix B1
                if B(p,q)==0
                    B1(p,q)=B(p,q);     %Keeping zero value as zero
                end
                if B(p,q)==1
                    B1(p,q)=B(p,q);     %Keeping one value as one
                end
            end
        end
        c=0;    %Counter for match values
        s=1;    %counter for moving around the rows of SE (B1)
        for p=i:i+m-1
            t=1;    %counter for moving around the rows of SE (B1)
            for q=j:j+n-1
                if Ip(p,q)==B1(s,t)
                    c=c+1;  %Counter increments if match
                end
                t=t+1;
            end
            s=s+1;
        end
        S1(i+p1,j+p2)=0.5;  %Initializing all elements of S1 as 0.5 (partial match)
        if c==0 %No match case
            S1(i+p1,j+p2)=0;    %Set S1 to zero
        end
        if c==(m*n) %Full match case
            S1(i+p1,j+p2)=1;    %Set S1 to one
        end
    end
end

%For taking care of the initial padding as per the mode given 
if mode=='full'
    S=S1;
end
if mode=='same'
    S=S1(p1+1:end-p1,p2+1:end-p2);
end
