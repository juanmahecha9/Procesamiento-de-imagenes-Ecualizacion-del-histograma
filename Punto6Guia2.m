%punto 6
% Calcule el valor promedio de la región de vecindad de 9 x 9 en una ventana deslizante sobre la imagen y almacene cada valor en una matriz de valores medios.
clc 
close all
clear all
I=imread('cameraman.tif');
figure, imshow(I)
info=imfinfo('mri.tif');
P=imfinfo('mri.tif');
W=P.Width; % Width
H=P.Height; % Heigth
B=P.BitDepth; % Bits
%boundary
IB=zeros(H+1,W+1);
for i=1:1:H
    for j=1:1:W
        IB(i,j)=I(i,j);
    end
end

% Para realizar la operacion
%IB=double(IB);
for i=5:5:H
    for j=5:5:W
       %Promedio
        IC(i/5,j/5) =(IB(i-4,j-4)+IB(i-4,j-3)+IB(i-4,j-2)+IB(i-4,j-1)+IB(i-4,j)+IB(i-4,j+1)+IB(i-4,j+2)+IB(i-4,j+3)+IB(i-4,j+4)+IB(i-3,j-4)+IB(i-3,j-3)+IB(i-3,j-2)+IB(i-3,j-1)+IB(i-3,j)+IB(i-3,j+1)+IB(i-3,j+2)+IB(i-3,j+3)+IB(i-3,j+4)+IB(i-2,j-4)+IB(i-2,j-3)+IB(i-2,j-2)+IB(i-2,j-1)+IB(i-2,j)+IB(i-2,j+1)+IB(i-2,j+2)+IB(i-2,j+3)+IB(i-2,j+4)+IB(i-1,j-4)+IB(i-1,j-3)+IB(i-1,j-2)+IB(i-1,j-1)+IB(i-1,j)+IB(i-1,j+1)+IB(i-1,j+2)+IB(i-1,j+3)+IB(i-1,j+4)+IB(i,j-4)+IB(i,j-3)+IB(i,j-2)+IB(i,j-1)+IB(i,j)+IB(i,j+1)+IB(i,j+2)+IB(i,j+3)+IB(i,j+4)+IB(i+1,j-4)+IB(i+1,j-3)+IB(i+1,j-2)+IB(i+1,j-1)+IB(i+1,j)+IB(i+1,j+1)+IB(i+1,j+2)+IB(i+1,j+3)+IB(i+1,j+4)+IB(i+2,j-4)+IB(i+2,j-3)+IB(i+2,j-2)+IB(i+2,j-1)+IB(i+2,j)+IB(i+2,j+1)+IB(i+2,j+2)+IB(i+2,j+3)+IB(i+2,j+4)+IB(i+3,j-4)+IB(i+3,j-3)+IB(i+3,j-2)+IB(i+3,j-1)+IB(i+3,j)+IB(i+3,j+1)+IB(i+3,j+2)+IB(i+3,j+3)+IB(i+3,j+4)+IB(i+4,j-4)+IB(i+4,j-3)+IB(i+4,j-2)+IB(i+4,j-1)+IB(i+4,j)+IB(i+4,j+1)+IB(i+4,j+2)+IB(i+4,j+3)+IB(i+4,j+4))./80;
           end
end
IC=uint8(IC);
figure(2), imshow(IC)
[X,Y]=meshgrid(IC);
figure,plot(X,Y);
[Q,F]=size(IC);
v=0;
I=double(I);
for i=1:1:Q
    for j=1:1:F
        v=I(i,j)+v;
    end
end
vm=v/(Q*F);
disp('Valor medio del Boundary'),disp(' = '),disp(vm)
