function g=imArithmetic4e(f1,f2,op)
f1=double(f1);
f2=double(f2);
if op=="add"
    g=f1+f2;
end
if op=="subtract"
    g=f1-f2;
end
if op=="multiply"
    g=f1.*f2;
end
if op=="divide"
    g=f1/f2;
end
