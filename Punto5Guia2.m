%punto 5
%Calcule el valor medio del brillo de la imagen completa
clear all;
clc;
close all;
I=imread('mri.tif');
[Q,F]=size(I);

v1=sum(sum(I)); % valor medio
va=v1/(Q*F);
disp('uso de funcion sum'),disp(' = '),disp(va)

v=0;
I=double(I);
for i=1:1:Q
    for j=1:1:F
        v=I(i,j)+v;
    end
end
vm=v/(Q*F);
disp('uso de for'),disp(' = '),disp(vm)
%23.1250