function [g,map]=intXform4e(f,mode,param)
[r,c]=size(f);
f=double(f);
s = intScaling4e(f,"default","floating"); %To have input image in the range of 0 to 1

if mode == "negative"
    for i=1:r
        for j=1:c
            g(i,j)= 1 - s(i,j);
        end
    end
    map = 1-s(i,j);
end

if mode == "log"
    const=1.0;
    for i=1:r
        for j=1:c
            g(i,j)= const*log(1+s(i,j));
        end
    end
    map = const*log(1+s(i,j));
end

if mode == "gamma"
     const=1.0;
    for i=1:r
        for j=1:c
            g(i,j)= const*(s(i,j).^param);
        end
    end
    map = const*(s(i,j).^param);
    
end

if mode == "external"
    for x=1:r
        for y=1:c
            temp=f(x,y)+1;
            g(x,y)=r(temp);
        end            
    end
    map=param;
%     for x=1:row
%         for y=1:col
%             temp=b(x,y)+1;
%             n(temp)=n(temp)+1; 
%         end
%     end
end
