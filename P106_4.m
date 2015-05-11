format long;
syms x;
f = exp(x);
phi = [x^0,x^1,x^2,x^3,x^4];
rho = [x^0,x^0,x^0,x^0,x^0];
interval = [0,1];
xx = linspace(0,1,1000);
y = exp(xx);

[B,P] = theBestSquareApproximation(f,phi,rho,interval)
figure('Name','四次最佳平方逼近');
g1 = plot(xx,y,'b');
hold on;
yy = subs(P,xx);
div1 = abs(y-yy)
g2 = plot(xx,yy,':g');
l1 = legend([g1,g2],'原函数曲线','四次最佳平方逼近曲线');
set(l1,'Location','NorthWest');

P = legendre(f,4)
figure('Name','勒让德正交多项式逼近');
g1 = plot(xx,y,'b');
hold on;
yy = subs(P,xx);
div2 = abs(y-yy)
g2 = plot(xx,yy,':g');
l2 = legend([g1,g2],'原函数曲线','勒让德正交多项式逼近曲线');
set(l2,'Location','NorthWest');

P = taylor(exp(x),'Order',5);
figure('Name','泰勒展开逼近');
g1 = plot(xx,y,'b');
hold on;
yy = subs(P,xx);
div3 = abs(y-yy);
g2 = plot(xx,yy,':g');
l3 = legend([g1,g2],'原函数曲线','泰勒展开逼近曲线');
set(l3,'Location','NorthWest');

figure('Name','前两者在[0,1]上的在误差分布');
g1 = plot(xx,div1,'g');
hold on;
g2 = plot(xx,div2,'m');
l4 = legend([g1,g2],'普通基函数逼近误差','勒让德正交多项式逼近误差');
set(l4,'Location','best');

figure('Name','三者在[0,0.3]上的误差分布');
g1 = plot(xx,div1,'g');
hold on;
g2 = plot(xx,div2,'m');
hold on;
g3 = plot(xx,div3,'b');
l5 = legend([g1,g2,g3],'普通基函数逼近误差','勒让德正交多项式逼近误差','泰勒展开逼近误差');
set(l5,'Location','best');
axis([0,0.3,0,0.0005]); 

figure('Name','三者在[0,1]上的误差分布');
g1 = plot(xx,div1,'g');
hold on;
g2 = plot(xx,div2,'m');
hold on;
g3 = plot(xx,div3,'b');
l5 = legend([g1,g2,g3],'普通基函数逼近误差','勒让德正交多项式逼近误差','泰勒展开逼近误差');
set(l5,'Location','best');