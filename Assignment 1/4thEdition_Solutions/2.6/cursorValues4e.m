 function [r1,c1,r2,c2]= cursorValues4e(f)
imshow(f)
[r,c]=ginput(2);
r1=floor(r(1));
r2=floor(r(2));
c1=floor(c(1));
c2=floor(c(2));
close all
end