%punto14 correciones lineales, exponenciales y gamma
clc
clear all
close all
I=imread('imagengauss.png');
info=imfinfo('imagengauss.png'); %informacion de la imagen
figure(1),imshow(I),title('Imagene original, ecualizada')
B=info.BitDepth;

[H W]=size(I);

%modifico contraste-----
%exp
x=0:1:(2^B);
Isalida1=I*0;

Y=30.*(exp(x.*(1/100)));
Lut=[x;Y];
for i=1:1:H
    for j=1:1:W
        [s1, pos]=find(x==I(i,j));
        Isalida1(i,j)=Y(pos);
    end
end
figure(2),imshow(Isalida1),title('LUT exponencial')

%Lut funcion lineal
x=0:1:(2^B);
Isalida2=I*0;
b=20;
Y=(1*x)+b;
Lut=[x;Y];
for i=1:1:H
    for j=1:1:W
        [s, pos]=find(x==I(i,j));
        Isalida2(i,j)=Y(pos);
    end
end
figure(3),imshow(Isalida2),title('LUT lineal')

%Lut gamma
x=0:1:(2^B);
Isalida3=I*0;
Y=((0.5*x)+2)+(10.*(exp(x.*(1/100))));
Lut=[x;Y];
for i=1:1:H
    for j=1:1:W
        [s, pos]=find(x==I(i,j));
        Isalida3(i,j)=Y(pos);
    end
end
figure(4),imshow(Isalida3),title('LUT gamma')

