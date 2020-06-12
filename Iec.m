function I=ecuhis(x)
clc

[m,n]=size(x); %Tamanho de la matriz
hi=zeros(1,2^8);
for i=1:m
    for j=1:n
        k=I(i,j);
              hi(k+1)=hi(k+1)+1;
           end;        
      end;

figure(3),bar(hi),title('Histograma') 
%% Ecualizar
%1. histograma de la imagen hi
% vector con amplitud entre 0 y 1
F=hi./(m*n);% funcion de probabilidad
%2. transformar la imagen en double
I=double(I);
%3.probabilidad acumulada
D=cumsum(F);

for i=1:1:(2^B)
    E(i)=D(i)+F(i);
end

for i=1:(2^B)
    ecual(i)=D(i)*(2^B);
end

for i=1:1:m
    for j=1:1:n
        K=I(i,j);
        Imq(i,j)=ecual(K+1);
    end
end

for i=1:1:m
    for j=1:1:n
        Iec(i,j)=Imq(i,j)-2;
    end
end
Iec=uint8(Iec);
