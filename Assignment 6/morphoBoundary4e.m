function BD=morphoBoundary4e(I,B)
%If B is not included in the arguments
if nargin ~=2
     B=ones(3,3);
end
E=imerode(I,B);
Ec=imcomplement(E);
BD=I&Ec;
