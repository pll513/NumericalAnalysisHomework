function normNum = getNormNum(A)
normNum = getColumnNorm(A) * max(sum(abs(inv(A))));