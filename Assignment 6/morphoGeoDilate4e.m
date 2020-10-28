function DG = morphoGeoDilate4e(F,G,B,n)
%Marker -- F -- Contains the start point for reconstruction
%Mask -- G --Constrains (conditions) the reconstruction
%Structuring element -- B

D=imdilate(F,B);
DG=D & G;

for i=2:n
  D=imdilate(DG,B);
  DG=D & G;
end