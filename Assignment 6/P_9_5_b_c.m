clc;
clear all;
I=imread("testpattern512-binary.tif");
Ic=imcomplement(I); %Image Complement
subplot(2,2,1); imshow(Ic);  title("Image Complement")

BD1=morphoBoundary4e(Ic);   %Boundary Extraction of Image Complement
subplot(2,2,2);  imshow(BD1);   title("Boundary with Image Complement")

subplot(2,2,3); imshow(I);  title("Original Image")

BD2=morphoBoundary4e(I);    %Boundary Extraction of Original Image
subplot(2,2,4); imshow(BD2);    title("Boundary without Image Complement")