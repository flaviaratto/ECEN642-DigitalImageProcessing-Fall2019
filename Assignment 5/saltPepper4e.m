function g =saltPepper4e(f,ps,pp)
[m,n]=size(f);
y=rand(size(f));    %Creating Uniform Random numbers

y(y<=ps)=1;  %Setting pixel values of y<= ps as 1
y(y>ps & y<=(ps+pp))=0; %Setting pixel values of y between ps and (ps+pp)as 0

%Applying Salt pepper noise to the image f
g=f;
for i=1:m
    for j=1:n
        if y(i,j)==0
            g(i,j)=0;   %Pepper Noise
        end
        if y(i,j)==1
            g(i,j)=1;   %Salt Noise
        end
    end
end