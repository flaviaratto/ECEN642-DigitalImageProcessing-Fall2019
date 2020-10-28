f1=imread('angiography-live-image.tif');
f2=imread('angiography-mask-image.tif');
R_int=imArithmetic4e(f1,f2,"subtract");
[r1,c1,n]=size(R_int);
for i=1:r1
    for j=1:c1
        if R_int(i,j)<0
                    R_int(i,j)=0;
        end
    end
end
R1=intScaling4e(R_int,"full","floating");
imshow(R1)