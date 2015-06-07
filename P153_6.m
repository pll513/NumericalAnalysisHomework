%153_6.m
clear;clc;format rat;

%生成矩阵
A = generateMatrixA(5)
B = generateMatrixA(10)

%列范数条件数
normNum1 = getNormNum(A)
normNum2 = getNormNum(B)

%散点图
X = zeros(1,30);
Y = zeros(1,30);
for i = 1:30
   X(i) = i;
   Y(i) = getNormNum(generateMatrixA(i));
   %Y(i) = log(getNormNum(generateMatrixA(i)));
end
g1 = plot(X,Y,'.');
set(g1,'color','m','Linewidth',2.5);
hold on;

%最小二乘拟合
M = polyfit(X,Y,6);
XX = 0:0.1:30;
YY = zeros(1,size(XX,2));
for i = 1:size(XX,2)
   YY(i) = polyval(M,XX(i));
end
g2 = plot(XX,YY);
set(g2,'Linestyle','-','color','g','Linewidth',1.5);

A1 = generateMatrixA(5);
b1 = rand(5,1);
x1a = SquareImproved(A1,b1)
x1b = Gauss(A1,b1)
A2 = generateMatrixA(10);
b2 = rand(10,1);
x2a = SquareImproved(A2,b2)
x2b = Gauss(A2,b2)
A3 = generateMatrixA(15);
b3 = rand(15,1);
x3a = SquareImproved(A3,b3)
x3b = Gauss(A3,b3)
A4 = generateMatrixA(20);
b4 = rand(20,1);
x4a = SquareImproved(A4,b4)
x4b = Gauss(A4,b4)

%误差
x1 = ones(5,1);
rNorm1 = max(x1a-x1)
x2 = ones(10,1);
rNorm2 = max(x2a-x2)
x3 = ones(15,1);
rNorm3 = max(x3a-x3)
x4 = ones(20,1);
rNorm4 = max(x4a-x4)

