function [OR,k]= morphoOpenbyRecon4e(MARKER, MASK)
%Mask given as input here is F
%Marker given as input here is the eroded version of F
B=ones(3,3);
[OR,k]= morphoReconDilate4e(MARKER,MASK,B);
