%P106_5_old_version.m
format long;
syms a;
syms b;
syms c;
syms d;
syms x;
syms y;
X = [0.0,0.1,0.2,0.3,0.5,0.8,1.0];
Y = [1.0,0.41,0.50,0.61,0.91,2.02,2.46];

%三次曲线拟合
P1 = polyfit(X,Y,3);
%四次曲线拟合
P2 = polyfit(X,Y,4);

%自定义函数拟合，选取对勾函数为拟合基底
n = length(xx);
F = @(x,a,b,c,d)a*x+b./(x-c)+d;
G = sqrt(sum((F(X,a,b,c,d)-Y).^2));
diff(G,a)
%这一步的计算时间很长，在我的电脑上要计算10分钟以上
[a,b,c,d] = solve(diff(G,a),diff(G,b),diff(G,c),diff(G,d))
g1 = plot(X,Y);
set(g1,'Linestyle','*','color','m','Linewidth',1.5);
hold on;
xx = 0:0.005:1;
Y1 = polyval(P1,xx);
Y2 = polyval(P2,xx);

%上面a,b,c,d的计算结果有14组解,只有第5组是符合要求的
yy = subs(a(5)*x+b(5)./(x-c(5))+d(5),xx);

%作图观察
g2 = plot(xx,Y1);
set(g2,'Linestyle','-','color','b','Linewidth',1.5);
hold on;
g3= plot(xx,Y2);
set(g3,'Linestyle','-','color','r','Linewidth',1.5);
hold on;
g4 = plot(xx,yy);
set(g4,'Linestyle','-','color','g','Linewidth',1.5);
l = legend([g1,g2,g3,g4],'数据点','三次拟合','四次拟合','自选函数拟合');
set(l,'Location','best');




