%Punto2
clear all;
clc;
close all;
%Calcule la función de probabilidad de densidad de brillo.I=imread('mri.tif');
I=imread('mri.tif'); % carga de la imagen
info=imfinfo('mri.tif'); %informacion de la imagen

[m n]=size(I);
hi=zeros(1,2^8);
for i=1:m
    for j=1:n
        k=I(i,j);
              hi(k+1)=hi(k+1)+1;
           end;        
      end;
F=hi./(m*n);% funcion de probabilidad

D=cumsum(F);
figure,bar(D)