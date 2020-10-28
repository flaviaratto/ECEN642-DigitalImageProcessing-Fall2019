clc;    clear all;
f1=imread("testpattern512.tif");
figure(1);   imshow(f1);  title("Original Image");
f1=double(f1);
f=intScaling4e(f1,"default","floating");    %Scaling Input

%SALT NOISE - Mild
g=saltPepper4e(f,0.002,0);
g=intScaling4e(g,"full","integer"); %Scaling Output
figure(2); subplot(2,2,1); imshow(g)
title("Image after adding mild salt noise, PS=0.002")

%SALT NOISE - Intermediate
g=saltPepper4e(f,0.02,0);
g=intScaling4e(g,"full","integer"); %Scaling Output
figure(2);subplot(2,2,2); imshow(g)
title("Image after adding intermediate salt noise, PS=0.02")

%SALT NOISE - Heavy
g=saltPepper4e(f,0.2,0);
g=intScaling4e(g,"full","integer"); %Scaling Output
figure(2); subplot(2,2,3); imshow(g)
title("Image after adding heavy salt noise, PS=0.2")

%SALT NOISE - Extra Heavy
g=saltPepper4e(f,0.5,0);
g=intScaling4e(g,"full","integer"); %Scaling Output
figure(2); subplot(2,2,4); imshow(g)
title("Image after adding extra heavy salt noise, PS=0.5")
