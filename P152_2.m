%152_2.m
clear;clc;format rat;

%随机矩阵A和右端向量b
n = ceil(10*rand(1));
P = 100*rand(n,n);
while (det(P)==0)
   P = rand(n,n); 
end
A = P'*P;
b = rand(n,1);

%改进的平方根方法
x = SquareImproved(A,b);
disp(x);