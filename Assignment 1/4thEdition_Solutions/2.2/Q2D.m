f=imread('girl.tif');
%Origin%
[row,col,pixel]=cursorValues4e(f);
disp("The coordinates and value of the center of the girl's right pupil is ["+row+","+col+"] and "+pixel+" respectively")