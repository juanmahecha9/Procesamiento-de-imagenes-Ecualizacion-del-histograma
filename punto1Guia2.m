%Punto 1
clear all
clc
close all
%Funcion de probabilidad de brillo
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
figure,imshow(I),title('Imagen')
figure,
subplot(2,1,1),stem(F),title('Probabilidad de brillo')
subplot(2,1,2),imhist(I),title('Probabilidad de brillo, Histograma (funcion)')
disp('Suma acumulada del histograma = '),disp(sum(F))