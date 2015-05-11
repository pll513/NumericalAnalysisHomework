%P106_5_new.m
%尝试使用nlinfit计算拟合曲线的数值解

clear; clc; format long;
X = [0.0,0.1,0.2,0.3,0.5,0.8,1.0];
Y = [1.0,0.41,0.50,0.61,0.91,2.02,2.46];

%拟合基函数使用f(x)=ax-b/(x^0.5-c)-d,其中a,b,c,d为待计算参数
F=inline('beta(1)*x-beta(2)./(x.^0.5-beta(3))-beta(4)','beta','x');
beta = nlinfit(X,Y,F,[0 0 0 0])
a = beta(1);
b = beta(2);
c = beta(3);
d = beta(4);

xx = 0:0.001:1;
yy = a.*xx-b./(xx.^0.5-c)-d;
g1 = plot(xx,yy);
set(g1,'LineStyle','-','color','g','Linewidth',1);
hold on;

%为了与自定义函数的效果做比较
%这里实现了一个nlinfit版的三次多项式最小二乘拟合
G = inline('beta(1)+beta(2).*x+beta(3).*x.^2+beta(4).*x.^3','beta','x');
beta = nlinfit(X,Y,G,[0 0 0 0])
a = beta(1);
b = beta(2);
c = beta(3);
d = beta(4);

xx = 0:0.001:1;
yy = a+b.*xx+c.*xx.^2+d.*xx.^3;
g2 = plot(xx,yy);
set(g2,'LineStyle','-','color','m','Linewidth',1);

g3 = plot(X,Y);
set(g3,'LineStyle','o','color','b','Linewidth',1);

l = legend([g1,g2,g3],'自定义函数拟合','三次拟合','数据点');
set(l,'Location','best');




