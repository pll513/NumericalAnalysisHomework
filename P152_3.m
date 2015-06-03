% 2013141463103 浦岸峰
% 第五次作业
% p152 3

clear;clc;format rat;

%生成随机三对角矩阵（3到10阶）
n = ceil(7*rand(1)+3);
a = 100 * rand(1,n-1);
b = 100 * rand(1,n);
c = 100 * rand(1,n-1);
d = zeros(1,n);
d(1) = 1;
d(n) = 1;

%追赶法求解线性方程组
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

disp('线性方程组的解为：');
disp(d');
