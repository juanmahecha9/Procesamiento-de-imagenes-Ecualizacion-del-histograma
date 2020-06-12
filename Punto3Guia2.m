%punto 3
%Normalizacion 0 y 1
% 
% clc 
% clear all
% close all
%  
% %asignacion de la imagen en una variable
% IO=imread('mri.tif');
% figure(1),imshow(IO),title('Original Image')
%  
% %Extraer Informacion de la imagen
% P=imfinfo('mri.tif');
% W=P.Width; % Width
% H=P.Height; % Heigth
% B=P.BitDepth; % Bits
%  
% % Imagen para trabajar
% for i=1:1:H
%     for j=1:1:W
%         I(i,j)=IO(i,j);
%     end
% end
%  
% %%
% %promedio de los datos de la matriz
% f=0;
% mediaA=0; %media aritmetica
% I=double(I);
% for i=1:1:H
%     for j=1:1:W
%         f=(I(i,j)+f);
%     end
% end
% mediaA=f/(H*W); %Miuf
%  
% %%
% %desviacion estandar y varianza
% V=0; 
% I=double(I);
% for i=1:1:H
%     for j=1:1:W
%        V=((I(i,j)-mediaA).^2)+V; %sumatoria de datos
%     end
% end
% Varianza=V/((W*H)-1); %Varianza de matriz (sigma^2)
% Desvest=sqrt(Varianza); % Desviacion estandar (sigma)
%  
% Cv = 100*(Desvest/mediaA);% coeficiente de variacion
% 
% 
% for i=1:1:W
%     for j=1:1:H
%         Z(i,j)=(((I(i,j)-mediaA))./Varianza);
%     end
% end
% 
% figure,imshow(Z)
% figure,hist(Z)

clear all
close all
clc
I=imread('mri.tif');
figure
imshow(I)
I=double(I); % convertir una imagen a double
mi=min(min(I)); % encontrar el minimo de la imagen
ma=max(max(I)); % maximo de la imagen
I2=(I-mi)/(ma-mi); % imagen nueva 
figure(2)
imshow(I2)
figure(3)
imhist(I2)

