clear all
clc
% carrega arquivo de dados
% data = T5Data(0.05);
% % x=data(:,1);
% pass=0.02;
% x=0:pass:1-pass;
% x=x';
% y=f(x);
data=importdata('data.mat');
x=data(:,1);
y=data(:,2);
plot(x,y,'x')
grid; xlabel('x'); ylabel('y'); title('Data original') 
Ne_oculta=4;
Ne_Saida=1;
alpha=0.03;
epocas=50000;
[W,M]=MLPTrain(Ne_oculta,Ne_Saida,epocas,alpha,x,y);

[Y]=MLPTest(W,M,x);


 plot(x,Y, 'b'); 
 hold on;
 plot(x,y, 'r*');
 hold off;

