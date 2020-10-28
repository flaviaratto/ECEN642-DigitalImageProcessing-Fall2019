function g = histEqual4e(f)

pdf = imageHist4e(f,'n');
cdf(1)=pdf(1);

for temp=2:256
     cdf(temp)=(pdf(temp)+cdf(temp-1)); %calculate cdf
end

for temp=1:256 
      param(temp)=round(cdf(temp)*255); %new value
end

mode = "external";
[g,map]=intXform4e(f,mode,param);
disp(map)