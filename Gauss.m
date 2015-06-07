function  b = Gauss(A,b)

m = size(A,1);
n = size(A,2);

for k = 1:m-1
    kmax = find(A(:,k) == max(A(k:m,k)),1);
    if (kmax ~= k)
        temp1 = A(kmax,:);
        A(kmax,:) = A(k,:);
        A(k,:) = temp1;
        temp2 = b(kmax);
        b(kmax) = b(k);
        b(k) = temp2;
    end
    if (A(k,k) ~= 0)
        for i = k+1:m
            A(i,k) = A(i,k) / A(k,k);
           for j = k+1:n
               A(i,j) = A(i,j) - A(i,k) * A(k,j);
           end
           b(i) = b(i) - A(i,k) * b(k);
        end
    end
end

b(m) = b(m) / A(m,m);
for i = m-1:-1:1
    sum = 0;
    for j = i+1:m
        sum = sum + A(i,j) * b(j);
    end
    b(i) = (b(i) - sum) / A(i,i);
end