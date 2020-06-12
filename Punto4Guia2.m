%punto 4
%normalizacion -1 y 1
clc 
clear all
close all
I=imread('mri.tif');
figure(1),imshow(I)
I=double(I);
mi=min(min(I)); %minimo de la imagen
ma=max(max(I)); %maximo de la imagen
I2 = ((I-mi)./(ma-mi)-0.5).*2; 
figure(2), imshow(I2)
figure(3),hist(I2), title('Histogram')

