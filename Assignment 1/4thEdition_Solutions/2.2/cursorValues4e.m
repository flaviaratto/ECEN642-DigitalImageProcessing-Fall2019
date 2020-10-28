 function [r,c,v]= cursorValues4e(f)
imshow(f)
[r,c]=ginput(1);
r=floor(r);
c=floor(c);
v=pixVal4e(f,r,c);
close all
end