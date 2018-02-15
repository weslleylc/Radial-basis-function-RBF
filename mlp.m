clear all
clc
% carrega arquivo de dados
% data = T5Data(0.05);
% % x=data(:,1);
data=importdata('data.mat');
x=data(:,1);
y=data(:,2);
% plot(x,y,'x')
% grid; xlabel('x'); ylabel('y'); title('Data original') 
% DESIGN THE NETWORK
net = newff(x,y,2);

% Define learning parameters
% net.trainParam.show = 50; % The result is shown at every 50th iteration (epoch)
net.trainParam.lr = 0.01; % Learning rate used in some gradient schemes
net.trainParam.epochs =50; % Max number of iterations
net.trainParam.goal = 1e-3; % Error tolerance; stopping criterion
%Train network
 net = train(net,x,y);
 Y = net(x);

 
  plot(x,Y, 'b'); 
 hold on;
 plot(x,y, 'r*');
 hold off;

