%Function for generating a matrix of gaussian and Uniform noise
function y=randomNumbers(type,m,n,mean,sd)

%For Gaussian Noise
if type=="Gaussian"
    y = sd.*randn(m,n) + mean;
end

%For Uniform Noise
if type=="Uniform"
    a=mean-(sqrt(3)*sd);
    b=mean+(sqrt(3)*sd);
    y=a+rand(m,n).*(b-a);
end