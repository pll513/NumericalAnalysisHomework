%legendre.m
function R = legendre(f,n)
syms x;
syms S;
syms R;
S = 0;

for i = 0:n
    S = S + diff((x*x-x)^i,i)/factorial(i)*...
        (2*i+1)*int(eval(f)*diff((x*x-x)^i,i)/factorial(i),0,1);
end

R = vpa(expand(S));