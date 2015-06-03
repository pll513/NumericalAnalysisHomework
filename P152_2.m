% 2013141463103 浦岸峰
% 第五次作业
% p152 2

clear;clc;format rat;

%产生可能大小为1到10的随机正定矩阵A和右端向量b
n = ceil(10*rand(1));
P = 100*rand(n,n);
while (det(P)==0)
   P = rand(n,n); 
end
A = P'*P;
b = rand(n,1);

disp('生成的随机矩阵A为:');
disp(A);
disp('生成的右端向量b为:');
disp(b);

%改进的平方根算法求解线性方程组
for i = 2:n
   for j = 1:i-1
       s1 = 0;
      for k = 1:j-1
         s1 = s1 + A(i,k)*A(k,k)*A(j,k); 
      end
      A(i,j) = (A(i,j) - s1)/A(j,j);
   end
   s2 = 0;
   for k = 1:i-1
         s2 = s2 + A(i,k)^2 * A(k,k);
   end
   A(i,i) = A(i,i) - s2;
end

for i = 2:n
    s3 = 0;
    for j = 1:i-1
       s3 = s3 + A(i,j) * b(j); 
    end
    b(i) = b(i) - s3;
end

for i = 1:n
   b(i) = b(i) / A(i,i); 
end

for i = n-1:-1:1
   s4 = 0;
   for j = i+1:n
      s4 = s4 + A(j,i) * b(j); 
   end
   b(i) = b(i) - s4;
end

disp('线性方程的解为：');
disp(b);