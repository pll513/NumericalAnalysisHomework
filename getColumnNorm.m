function columnNorm = getColumnNorm(A)
if size(A,1)>1
    columnNorm = max(sum(abs(A)));
else
    columnNorm = max(abs(A));
end