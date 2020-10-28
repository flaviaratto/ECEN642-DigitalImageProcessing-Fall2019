function s=scanLine4e(f,l,loc)
[r,c]=size(f);
if loc == "row"
    for i=1:c
    s(i)=f(l,i);
    end
end
if loc == "col"
    for i=1:r
    s(i)=f(i,l);
    end
end
end
