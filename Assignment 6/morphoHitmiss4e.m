function H=morphoHitmiss4e(I,B,padval,mode)
[m,n]=size(B);  %Size of structuring element
p1=m;   p2=n;   %For padding
Ip=padarray(I,[p1,p2],padval,'both'); %Padding binary image

%Taking complement of Image and Structuring element
Ic=imcomplement(Ip);    Bc=imcomplement(B);
H1=imerode(Ip,B) & imerode(Ic,Bc);

%To take care of the initial padding as per the mode given
if mode=='full'
    H=H1;
end
if mode=='same'
    H=H1(p1+1:end-p1,p2+1:end-p2);
end
