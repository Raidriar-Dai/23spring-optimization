function t = backtracking(grad,m,n,A,b,x,t0,alpha,beta)
t = t0;
while l_value(m,n,A,b,x) - l_value(m,n,A,b,x-t*grad) < alpha*t*(norm(grad,2)^2)
    t = beta * t;
end
