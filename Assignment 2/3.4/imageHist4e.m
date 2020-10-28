function h=imageHist4e(f,mode)
[r,c]=size(f);
n=zeros(256); 
h=zeros(256); %initializing the histogram array

%unnormalized histogram
if mode =='u'
    for i=1:r
        for j=1:c
            k=f(i,j)+1; %Incrementing pixel value by 1 to get the range of pixel from 1 to 256 instead of 0 to 255 
            h(k)=h(k)+1; %Incrementing the count of the pixels in f with intensity k
        end
    end
end

%normalized histogram
if mode=='n'
    for i=1:r
        for j=1:c
            k=f(i,j)+1; %Incrementing pixel value by 1 to get therange of pixel from 1 to 256 instead of 0 to 255 
            n(k)=n(k)+1; %Incrementing the count of the pixels in f with intensity k
        end
    end
    
    for k=1:256
        h(k)=n(k)/(r*c); %normalizing
    end
end