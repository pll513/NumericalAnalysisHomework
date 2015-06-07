function A = generateMatrixA(n)
A = zeros(n,n);
for i = 1:n
   for j = 1:n
       if i==j
           A(i,j) = 1/(i+j-1)+1/2;
       else
           A(i,j) = 1/(i+j-1);
       end
   end
end