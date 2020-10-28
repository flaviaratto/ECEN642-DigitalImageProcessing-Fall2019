clc;    clear all;
f1=imread("testpattern512.tif");
figure(1);   imshow(f1);  title("Original Image");
f1=double(f1);
f=intScaling4e(f1,"default","floating");    %Scaling input

%PEPPER NOISE - Mild
g=saltPepper4e(f,0,0.002);
g=intScaling4e(g,"full","integer"); %Scaling Output
figure(2); subplot(2,2,1); imshow(g)
title("Image after adding mild pepper noise, PP=0.002")

%PEPPER NOISE - Intermediate
g=saltPepper4e(f,0,0.02);
g=intScaling4e(g,"full","integer");  %Scaling Output
figure(2); subplot(2,2,2); imshow(g)
title("Image after adding intermediate pepper noise, PP=0.02")

%PEPPER NOISE - Heavy
g=saltPepper4e(f,0,0.2);
g=intScaling4e(g,"full","integer");  %Scaling Output
figure(2); subplot(2,2,3); imshow(g)
title("Image after adding heavy pepper noise, PP=0.2")

%SALT NOISE - Extra Heavy
g=saltPepper4e(f,0,0.5);
g=intScaling4e(g,"full","integer");  %Scaling Output
figure(2); subplot(2,2,4); imshow(g)
title("Image after adding extra heavy pepper noise, PP=0.5")
