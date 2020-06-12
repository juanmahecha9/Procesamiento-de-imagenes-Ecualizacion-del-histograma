%punto 9
%coeficiente de variacion
clc 
clear all
close all
 
%asignacion de la imagen en una variable
IO=imread('mri.tif');
figure(1),imshow(IO),title('Original Image')
 
%Extraer Informacion de la imagen
P=imfinfo('mri.tif');
W=P.Width; % Width
H=P.Height; % Heigth
B=P.BitDepth; % Bits
 
% Imagen para trabajar
for i=1:1:H
    for j=1:1:W
        I(i,j)=IO(i,j);
    end
end
 
%%
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
 
Cv = 100*(Desvest/mediaA);% coeficiente de variacion
 
disp('Coeficiente de variacion'),disp(' = '),disp(Cv)
