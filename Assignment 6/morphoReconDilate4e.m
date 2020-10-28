function [RD,k]= morphoReconDilate4e(F,G,B)
%Marker -- F -- Contains the start point for reconstruction
%Mask -- G --Constrains (conditions) the reconstruction
%Structuring element -- B

D=imdilate(F,B);
RD=D & G;
k=1;
%Till Convergence
while (~isequal(RD,F))
    F=RD;
    D=imdilate(RD,B);
    RD=D & G;  
    k=k+1;
end
