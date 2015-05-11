% 实现拉格朗日插值函数
% X表示自变量所对应矩阵
% Y表示因变量所对应矩阵
function fp=lagrange_interpolation(X,Y)
% 变量定义
format long;	% 增加数字显示位数
n = length(X);  % 获取变量个数
syms x;         % 为实现多项式计算引入的变量
l = 1;			% 计算L(x)时使用的中间变量
L = 0;			% 拉格朗日插值多项式L(x)
%l = ones(1,n);
%L = zeros(1,n);


for i = 1:n
    for j = 1:i-1
        l = l * (x-X(j))/(X(i)-X(j));
    end
    for j = i+1:n 
        l = l * (x-X(j))/(X(i)-X(j));
    end 
    L = L + l * Y(i);
    l = 1;
end


%{
for i = 1:n
    for j = 1:i-1
        l(j) = (x-X(j))/(X(i)-X(j));
    end
    for j = i+1:n 
        l(j) = (x-X(j))/(X(i)-X(j));
    end 
    L(j) = prod(l) * Y(i);
end
L = sum(L);
%}

% 返回结果
% 把L(x)展开成多项式系数矩阵
% 例: (x+1)*(x-2)*x+3 的计算结果为
%     [1, -1, -2, 3]
fp = sym2poly(L);