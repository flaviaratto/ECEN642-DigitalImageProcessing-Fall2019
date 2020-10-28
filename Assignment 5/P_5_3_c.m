clc;    clear all;
f1=imread("testpattern512.tif");
figure(1);   imshow(f1);  title("Original Image");
f1=double(f1);
f=intScaling4e(f1,"default","floating");    %Scaling input

%SALT PEPPER NOISE - Mild
g=saltPepper4e(f,0.001,0.001);
g=intScaling4e(g,"full","integer"); %Scaling output
figure(2); subplot(2,2,1); imshow(g)
title("Image after adding mild salt pepper noise, PS=0.001 PP=0.001")

%SALT PEPPER NOISE - Intermediate
g=saltPepper4e(f,0.01,0.01);
g=intScaling4e(g,"full","integer"); %Scaling output
figure(2); subplot(2,2,2); imshow(g)
title("Image after adding intermediate salt pepper noise, PS=0.01 PP=0.01")

%SALT PEPPER NOISE - Heavy
g=saltPepper4e(f,0.08,0.08);
g=intScaling4e(g,"full","integer"); %Scaling output
figure(2); subplot(2,2,3); imshow(g)
title("Image after adding heavy salt pepper noise, PS=0.08 PP=0.08")

%SALT PEPPER NOISE - Extra Heavy
g=saltPepper4e(f,0.3,0.3);
g=intScaling4e(g,"full","integer"); %Scaling output
figure(2); subplot(2,2,4); imshow(g)
title("Image after adding extra heavy salt pepper noise, PS=0.3 PP=0.3")
