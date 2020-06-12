%punto12
clc
clear all
close all
I=imread('Ecualizacion.png');
figure(1),imshow(I),title('ecualizada')

info=imfinfo('ecualizacion.png'); %informacion de la imagen
B=info.BitDepth;
Bits=(2^B);
[H W]=size(I);
% [m n]=size(I);
% hi=zeros(1,Bits);
% for i=1:m
%     for j=1:n
%         k=I(i,j);
%               hi(k+1)=hi(k+1)+1;
%     end        
% end
% %probabilidad en el histograma
% %1. Media 
% 
% f=0;
% media=0;
% 
% for i=1:1:Bits
%     f=hi(i)+f;
% end
% media=f/Bits;
% 
% V=0;
% for i=1:1:Bits
%        V=((hi(i)-media).^2)+V; %sumatoria de datos
% end
% Varianza=V/((Bits)-1); %Varianza de matriz (sigma^2)
% Desvest=sqrt(Varianza); % Desviacion estandar (sigma)
% 
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


%Distribucion exponencial.
DEX=0;
Lamda=(1/mediaA);
for i=1:1:H
    for j=1:1:W
        DEX(i,j)=(1-(exp(-(Lamda)*I(i,j))));
    end
end

mi=min(min(DEX)); %minimo de la imagen
ma=max(max(DEX)); %maximo de la imagen
I2 = (DEX-mi)./(ma-mi); 
mae=max(max(I2));
Is=(I2.*(2^B));
Is=floor(Is);
Ia=uint8(Is);

figure(2),imshow(Ia),title('Distribucion exponencial')


%Distribucion Gaussiana
DG=0;
a=(1/(Desvest*sqrt(2*pi)));
for i=1:1:H
    for j=1:1:W
        DG(i,j)=a.*(exp(-((I(i,j)-mediaA))./(2*Varianza)));
    end
end

mi1=min(min(DG)); %minimo de la imagen
ma1=max(max(DG)); %maximo de la imagen
I3 = (DG-mi1)./(ma1-mi1); 
mag=max(max(I2));
Is1=(I3.*(2^B));
Is1=floor(Is1);
Ia1=uint8(Is1);
figure(3),imshow(Ia1),title('Distribucion Gaussiana')

%Distribucion Rayleigh
DR=0;
for i=1:1:H
    for j=1:1:W
        DR(i,j)=(I(i,j).*exp((-I(i,j).^2))./(2*Varianza))./(Varianza);
    end
end

mi2=min(min(DG)); %minimo de la imagen
ma2=max(max(DG)); %maximo de la imagen
I4 = (DR-mi2)./(ma2-mi2); 
mag=max(max(I2));
Is2=(I4.*(2^B));
Is2=floor(Is2);
Ia2=uint8(Is2);
figure(4),imshow(Ia2),title('Distribucion Rayleigh')
