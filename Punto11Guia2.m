%punto 11
%Ecualizar el histograma de la imagen y mostrar los resultados.
clear all
clc
close all
I=imread('mamografia.png'); % carga de la imagen

Ecu=histeq(I);

figure(1), subplot(1,2,1),imshow(I), title('Imagen Original')
           subplot(1,2,2),imhist(I), title('histograma de la imagen con la fucion')
figure(2), subplot(1,2,1),imshow(Ecu), title('ecualizar histograma de la imagen con la fucion')
           subplot(1,2,2), imhist(Ecu), title('histograma ecualizar histograma de la imagen con la fucion')
info=imfinfo('mamografia.png'); %informacion de la imagen
W=info.Width; % Ancho de la imagen
B=info.BitDepth;

[m,n]=size(I); %Tamanho de la matriz
mayor=max(max(I));
menor=min(min(I));

[m n]=size(I);
hi=zeros(1,2^B);
for i=1:m
    for j=1:n
        k=I(i,j);
              hi(k+1)=hi(k+1)+1;
           end;        
      end;

figure(3),bar(hi),title('Histograma') 
%% Ecualizar
%1. histograma de la imagen hi
% vector con amplitud entre 0 y 1
F=hi./(m*n);% funcion de probabilidad
%2. transformar la imagen en double
I=double(I);
%3.probabilidad acumulada
D=cumsum(F);

for i=1:(2^B)
    ecual(i)=D(i)*(2^B);
end

for i=1:1:m
    for j=1:1:n
        K=I(i,j);
        Iec(i,j)=ecual(K+1);
    end
end

% for i=1:1:m
%     for j=1:1:n
%         Iec1(i,j)=Imq(i,j)-2;
%     end
% end
Iec=uint8(Iec);
imwrite(Iec,'Ecualizacion.png');

figure(4), imshow(Iec),title('Imagen ecualizada')
figure(5), imhist(Iec), title('histogrma de la funcion ecualizada')
