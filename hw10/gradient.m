function [y] = gradient(m, n, A, b, x)
p = 1 ./ (1 + exp(-b.*(A*x)));
e = ones(m,1);
y = -A' * (b.*(e-p))/m + 1/(50*m)*x;