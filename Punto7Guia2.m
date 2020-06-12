%Punto 7
%Promedio del histograma
clc
clear all
close all
%Funcion de probabilidad de brillo
I=imread('mri.tif'); % carga de la imagen
P=imfinfo('mri.tif');
W=P.Width; % Width
H=P.Height; % Heigth
B=P.BitDepth; % Bits


[Q,F]=size(I);
v=0;
I=double(I);
for i=1:1:Q
    for j=1:1:F
        v=I(i,j)+v;
    end
end
vm=v/(Q*F);
disp('Valor medio de brillo en la imagen'),disp(' = '),disp(vm)

%Hi=zeros(1,W); % vector fila inicializado en ceros
for i=1:W
    Hi(i)=0;
end

for i=1:1:H% limit on the reduced matrix in factor 2
    for j=1:1:W
       Hi(I(i,j)+1)=Hi(I(i,j)+1)+1;  %histograma en la posicion del nivel es 0 y al encontrarlo se suma 1
                                      %Buscar los pixeles en valor 0 
    end
end
s=0;
t=W;
for i=1:1:t
    
    s = (Hi(i)*i)+ s;
end
MedHis=(s/(H*W))-1;

disp('Calcule el promedio del histograma de brillo'),disp(' = '),disp(MedHis)


