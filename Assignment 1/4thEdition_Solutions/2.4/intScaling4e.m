function g = intScaling4e(f,mode,type)
[r,c,n]=size(f);
M0=min(min(f));
M1=max(max(f));
h=zeros(r,c);
g=zeros(r,c);

if n==3
   f=rgb2gray(f);
end
if mode=="default"
    if M0<0
        mode="full";
    end
    if M0>=0 && M1>1
        for i=1:r
            for j=1:c
                g(i,j)=f(i,j)/M1;
            end
        end
    end
    if M0==0 && M1==1
        for i=1:r
            for j=1:c
                g(i,j)=f(i,j);
            end
        end
    end
end
        
if mode=="full"
    if type=="integer"
        K=255;
        for i=1:r
            for j=1:c
                h(i,j)=f(i,j)-M0;
                g(i,j)=floor(K*h(i,j)/M1);              
            end
        end
        g=uint8(g);
    end
   if type=="floating"
        K=1;
       for i=1:r
            for j=1:c
                h(i,j)=f(i,j)-M0;
                g(i,j)=(K*h(i,j)/M1);
            end
       end 
   end
end

if n==3
   g=gray2rgb(g);
end