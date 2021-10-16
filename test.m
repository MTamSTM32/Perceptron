clc;
clear all;
a = [2 ; 2] ; 
b = [1 ; -2];
c = [-2 ; 2];
d = [-1 ; 1];

T = [0 1 0 1];
P = [a b c d];

net = newp(P,T,'hardlim');
net = init(net);
A = [];
W = [0 0];

p1 = P(:,1);
t1 = T(1);

a = sim(net,p1);
e = t1-a;

for i = 1:4
    p1 = P(:,i);
    t1 = T(i);
    e = t1-a;
    for j = 1:4
        net.IW{1,1} = W; % [-2 -2] [0 -4]
        e = t1 - a;

        dw = learnp(W,p1,[],[],[],[],e,[],[],[],[],[]);
%         disp(dw);
        W = W + dw;
%         disp(W);
        net.IW{1,1} = W;
%         disp(W);
        a = sim(net,p1);
        disp(a);
    end
    a = sim(net,p1);
    A(end+1) = a;
end
disp(A)
disp(A)
