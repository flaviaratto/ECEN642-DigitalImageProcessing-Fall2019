function [CR,k]= morphoClosebyRecon4e(MARKER, MASK)
%Mask is F
%Marker given as input here is the dilated version of F
B=ones(3,3);
[CR,k]= morphoReconErode4e(MARKER,MASK,B);
