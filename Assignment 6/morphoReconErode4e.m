function [RE,k]= morphoReconErode4e(F,G,B)
%Marker -- F -- Contains the start point for reconstruction
%Mask -- G --Constrains (conditions) the reconstruction
%Structuring element -- B

D=imerode(F,B);
RE=D | G;
k=1;
%Till Convergence
while (~isequal(RE,F))
    F=RE;
    D=imerode(RE,B);
    RE=D | G;  
    k=k+1;
end