%punto 13
%funcion gaussiana
clc
clear all
close all
I=imread('Ecualizacion.png');
A=imread('mamografia.png');
figure,imshow(A),title('Original')
figure,imshow(I),title('ecualizada')

info=imfinfo('ecualizacion.png'); %informacion de la imagen
B=info.BitDepth;
[H W]=size(I);
%promedio de los datos de la matriz
f=0;
mediaA=0; %media aritmetica
I=double(I);
for i=1:1:H
    for j=1:1:W
        f=(I(i,j)+f);
    end
end
mediaA=f/(H*W); %Miuf
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
 
%Lut gaussina
I=double(I);

x=0:1:(2^B);
Isalida3=I*0;
a=(1/(Desvest*sqrt(2*pi)));
e=(((x-mediaA))./(2*Varianza));
Y=(a*exp(e));
Lut=[x;Y];

for i=1:1:H
    for j=1:1:W
        [s, pos]=find(x==I(i,j));
        Isalida3(i,j)=Y(pos);
    end
end
Isalida3=double(Isalida3);
mi=min(min(Isalida3)); %minimo de la imagen
ma=max(max(Isalida3)); %maximo de la imagen
I2 = (Isalida3-mi)./(ma-mi); 
ma2=max(max(I2));

Is=(I2.*(2^B));
Is=floor(Is);
Ia=uint8(Is);
figure,imshow(Ia),title('LUT Gaussiano')
imwrite(Ia,'imagengauss.png');