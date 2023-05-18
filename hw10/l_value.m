function y = l_value(m,n,A,b,x)
p=1./(1+exp(-b.*(A*x)));
e = ones(m,1);
y = -e'*log(p)/m + 1/(100*m)*(norm(x,2)^2);