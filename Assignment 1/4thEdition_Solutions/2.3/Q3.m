f=imread("rose1024.tif");
[r,c]=size(f);
% if loc == "row"
%     l=round(r/2);
% end
% if loc == "col"
%     l=round(c/2);
% end
value = scanLine4e(f,floor(r/2),"row");
plot(value)