clc;
clear all;
f1=fopen('\\toaster\homes\f\l\flaviaratto\nt\AccountSettings\Desktop\DIP Assignment\Assignment 3\3.10\lpkernel1D_2.txt','r');
f=fscanf(f1,['%f' ',']);
g=transpose(f);
plot(g) %I-D Plot
title("A 1-D filter kernel plot")