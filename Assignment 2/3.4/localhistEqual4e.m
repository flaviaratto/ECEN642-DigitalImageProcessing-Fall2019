function g = localhistEqual4e(f,m,n)

%replicate padding of f
f=padarray(f,[m,n],'replicate','both');
disp(size(f))
[row,col] = size(f);
%pdf=imageHist4e(f,'n');
c=zeros(1,256);
r=zeros(1,256);
for i=2:(row-m)
    for j=2:(col-n)
        p=i-1;
        q=j-1;
        for x=p:(p+m)
            for y=q:(q+m)
                temp=f(x,y)+1;    %+1 is added because array cannot take 0 value
                c(temp)=c(temp)+1;  
                
            end
        end
        for temp=1:256
            pdf(temp)=c(temp)/(row*col); %calculate pdf
        end
        cdf(1)=pdf(1);

        for temp=2:256
            cdf(temp)=(pdf(temp)+cdf(temp-1)); %calculate cdf
        end
        for temp=1:256
            r(temp)=round(cdf(temp)*255); %new value
        end
        
        temp=f(i,j)+1;
        g(i,j)=r(temp);
    end
end