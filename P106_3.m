%P106_3.m

format long;
syms x;
f = sin(pi*x/2);
phi1 = [x^0,x^1,x^2,x^3];
phi2 = [x^0,x^1,x^2,x^3,x^4,x^5];
rho1 = [x^0,x^0,x^0,x^0];
rho2 = [x^0,x^0,x^0,x^0,x^0,x^0];
interval = [-1,1];
xx = linspace(-1,1,1000);
y = sin(pi*xx/2);


[B,P] = theBestSquareApproximation(f,phi1,rho1,interval)
figure('Name','三次最佳平方逼近');
g1 = plot(xx,y,'b');
hold on;
yy = subs(P,xx);
div1 = abs(y-yy);
g2 = plot(xx,yy,':g');
l1 = legend([g1,g2],'原函数曲线','三次最佳平方逼近曲线');
set(l1,'Location','NorthWest');
xlabel('x');
ylabel('y');
axis([-1,1,-1,1]); 


[B,P] = theBestSquareApproximation(f,phi2,rho2,interval)
figure('Name','五次最佳平方逼近');
g1 = plot(xx,y,'b');
hold on;
yy = subs(P,xx);
div2 = abs(y-yy);
g2 = plot(xx,yy,':g');
l2 = legend([g1,g2],'原函数曲线','五次最佳平方逼近曲线');
set(l2,'Location','NorthWest');
xlabel('x');
ylabel('y');
axis([-1,1,-1,1]); 


figure('Name','误差分布');
g1 = plot(xx,div1,'g');
hold on;
g2 = plot(xx,div2,'m');
l3 = legend([g1,g2],'三次最佳平方逼近误差','五次最佳平方逼近误差');
set(l3,'Location','best');
xlabel('x');
ylabel('div');