function t = backtracking_with_input_d(grad,d,m,n,A,b,x,t0,alpha,beta)
t = t0;
while l_value(m,n,A,b,x+t*d) - l_value(m,n,A,b,x) > alpha*t*grad'*d
    t = beta * t;
end