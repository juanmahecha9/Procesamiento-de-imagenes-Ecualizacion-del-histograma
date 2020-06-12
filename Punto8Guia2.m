%punto 8
%Calcular la desviación estándar de la imagen y usar la información del histograma.
 
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
disp('Desviacion estandar de la matriz'),disp(' = '),disp(Desvest)
 
[m n]=size(I);
hi=zeros(1,2^8);
for i=1:m
    for j=1:n
        k=I(i,j);
              hi(k+1)=hi(k+1)+1;
           end;        
      end;
      
   f1=0;
mediaA1=0; %media aritmetica
for i=1:1:H
            f1=hi(i)+f1;
 end
mediaA1=f1/length(hi); %Miu
V1=0;
for i=1:1:length(hi)
         V1=((hi(i)-mediaA1).^2)+V1; %sumatoria de datos
    end

Varianza1=V1/((W*H)-1); %Varianza de matriz (sigma^2)
Desvest1=sqrt(Varianza); % Desviacion estandar (sigma)
disp('Desviacion estandar del histograma'),disp(' = '),disp(Desvest1)
