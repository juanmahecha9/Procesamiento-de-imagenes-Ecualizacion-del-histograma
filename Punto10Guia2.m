%Punto 10
%Calcular el ruido de señal a la relación SNR de la imagen.
clc 
close all
clear all
I=imread('mri.tif');
info=imfinfo('mri.tif');
P=imfinfo('mri.tif');
W=P.Width; % Width
H=P.Height; % Heigth
B=P.BitDepth; % Bits
 
%promedio de los datos de la matriz
f=0;
mediaA=0; %media aritmetica
I=double(I);
for i=1:1:H
    for j=1:1:W
        f=(I(i,j)+f);
    end
end
mediaA=f/(H*W); %Miu
 
%%
%desviacion estandar y varianza
V=0; 
I=double(I);
for i=1:1:H
    for j=1:1:W
       V=((I(i,j)-mediaA).^2)+V; %sumatoria de datos
    end
end
Varianza=V/((W*H)-1); %Varianza de matriz (sigma^2)
Desvest=sqrt(Varianza); % Desviacion estandar (sigma)
mi=(min(min(I)));
ma=(max(max(I)));
 
 
 
SNR=10*log10((ma-mi)./Desvest);
disp('SNR'),disp(' = '),disp(SNR)
 


