clc;    clear all;
f1=imread("testpattern512.tif");
figure(1);   imshow(f1);  title("Original Image");
f=intScaling4e(f1,"default","floating"); %Scaling Input
[m,n]=size(f);
mean=0.25;  %Setting Mean
%GAUSSIAN NOISE
y1=randomNumbers("Gaussian",m,n,mean,0.03);    %Mild
g1=f+y1;
g1=intScaling4e(g1,"full","floating"); %Scaling Output
figure(2);   subplot(2,2,1); imshow(g1)
title("Image after adding mild gaussian noise, SD=0.03")

y2=randomNumbers("Gaussian",m,n,mean,0.2);    %Intermediate
g2=f+y2;
g2=intScaling4e(g2,"full","floating");  %Scaling Output
figure(2);  subplot(2,2,2); imshow(g2)
title("Image after adding intermediate gaussian noise, SD=0.2")

y3=randomNumbers("Gaussian",m,n,mean,0.5);    %Heavy
g3=f+y3;
g3=intScaling4e(g3,"full","floating");  %Scaling Output
figure(2); subplot(2,2,3); imshow(g3)
title("Image after adding heavy gaussian noise, SD=0.5")

y4=randomNumbers("Gaussian",m,n,mean,1.2);    %Extra Heavy
g4=f+y4;
g4=intScaling4e(g4,"full","floating");  %Scaling Output
figure(2); subplot(2,2,4); imshow(g4)
title("Image after adding extra heavy gaussian noise, SD=1.2")