%theBestSquareApproximation.m
%最佳n次平方逼近函数
%返回值B为基函数对应系数
%返回值P为最佳平方多项式
function [B,P] = theBestSquareApproximation(f,phi,rho,interval)
a = interval(1);
b = interval(2);
n = length(phi);
A = zeros(n);
C = zeros(n,1);
syms x;
for i = 1:n
    A(i,:) = int(eval(rho(i))*eval(phi(i))*eval(phi),a,b);
    eval(rho(i))*eval(phi(i))*eval(phi);
    C(i) = int(eval(rho(i))*eval(f)*eval(phi(i)),a,b);
end
B = (A\C)';
P = vpa(eval(sum(phi.*B)));