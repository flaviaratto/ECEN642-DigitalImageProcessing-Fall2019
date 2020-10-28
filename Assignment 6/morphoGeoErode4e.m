function DG = morphoGeoErode4e(F,G,B,n)
%Marker -- F -- Contains the start point for reconstruction
%Mask -- G --Constrains (conditions) the reconstruction
%Structuring element -- B

D=imerode(F,B);
DG=D | G;

for i=2:n
  D=imerode(DG,B);
  DG=D | G;
end