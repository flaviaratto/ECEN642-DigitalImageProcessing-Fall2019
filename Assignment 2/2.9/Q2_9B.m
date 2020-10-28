clc;
clear all;
f=imread("rose1024.tif");
OP=imageHist4e(f,'n');
bar(OP,50)
title('Histogram plot')
ylabel('Number of pixels at that intensity')
xlabel('Intensity Levels')