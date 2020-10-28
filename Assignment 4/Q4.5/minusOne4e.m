function g = minusOne4e(f)
[r,c]=size(f);
%floating point check
check=isa(f,'double');

if check ==0
    disp("The input image must be in floating point range")
end

if check ==1    
    %Centering
    for i=1:r
        for j=1:c
            g(i,j)=((-1)^(i+j))*f(i,j);
        end
    end
end