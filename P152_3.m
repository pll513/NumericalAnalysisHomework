%152_3.m
clear;clc;format rat;

%随机三对角矩阵
n = ceil(7*rand(1)+3);
a = 100 * rand(1,n-1);
b = 100 * rand(1,n);
c = 100 * rand(1,n-1);
d = zeros(1,n);
d(1) = 1;
d(n) = 1;

%追赶法
for i = 2:n
   c(i-1) = c(i-1)/b(i-1);
   b(i) = b(i) - a(i-1)*c(i-1);
end
d(1) = d(1)/b(1);
for i = 2:n
   d(i) = (d(i) - a(i-1)*d(i-1))/b(i); 
end
for i = n-1:-1:1
   d(i) = d(i) - c(i)*d(i+1); 
end

disp(d');
