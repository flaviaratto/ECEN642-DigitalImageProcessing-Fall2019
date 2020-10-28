clc;
clear all;

%Ideal LPF
H_ideal=lpFilterTF4e("ideal",512,512,96);
subplot(1,3,1)
imshow(H_ideal)
title("Lowpass ideal filter transfer function")

%Gaussian LPF
H_gaussian=lpFilterTF4e("gaussian",512,512,96);
subplot(1,3,2)
imshow(H_gaussian)
title("Lowpass gaussian filter transfer function")

%Butterworth LPF
H_butterworth=lpFilterTF4e("butterworth",512,512,[96,2]);
subplot(1,3,3)
imshow(H_butterworth)
title("Lowpass butterworth filter transfer function")
