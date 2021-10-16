clc;
clear all;

% Tap du lieu
p1 = [2 ; 2] ; t1 = 0;
p2 = [1 ; -2]; t2 = 1;
p3 = [-2 ; 2]; t3 = 0;
p4 = [-1 ; 1]; t4 = 1;

T = [t1 t2 t3 t4];
P = [p1 p2 p3 p4];

net = newp(P,T);
net.IW{1,1} = [0,0];
net.b{1} = 0;

net.trainParam.epochs = 10;

net = train(net,P,T);
disp('Gia tri huan luyen a:');
a = sim(net,P);
disp(a);

