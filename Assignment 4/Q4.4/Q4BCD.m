clc;
clear all;

%Ideal HPF
H_ideal=hpFilterTF4e("ideal",512,512,96);
subplot(1,3,1)
imshow(H_ideal)
title("Highpass ideal filter transfer function")

%Gaussian LPF
H_gaussian=hpFilterTF4e("gaussian",512,512,96);
subplot(1,3,2)
imshow(H_gaussian)
title("Highpass gaussian filter transfer function")

%Butterworth LPF
H_butterworth=hpFilterTF4e("butterworth",512,512,[96,2]);
subplot(1,3,3)
imshow(H_butterworth)
title("Highpass butterworth filter transfer function")
