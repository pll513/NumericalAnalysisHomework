function b = SquareImproved(A,b)
n = size(A,1);
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