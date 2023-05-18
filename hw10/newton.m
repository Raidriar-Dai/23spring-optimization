function [grad_norm, l_value_loss] = newton(dataset, alpha, beta, t0)
% alpha=0.3; beta=0.6; t0=1
% dataset = 'ijcnn1.test';
fprintf("exact_newton: alpha=%.1f, beta=%.1f, t0=%.1f\n",alpha, beta, t0)
[b,A] = libsvmread(dataset);
[m,n] = size(A);
mu = 1e-2/m;

x = zeros(n,1);
grad_norm = [];
l_value_loss = [];

grad=gradient(m,n,A,b,x);
ng = norm(grad,2);
while ng >= 1e-6
    d = Ndirection(m,n,A,b,grad,x);
    t = backtracking_with_input_d(grad,d,m,n,A,b,x,t0,alpha,beta);
    x = x + t*d;
    grad_norm = [grad_norm,ng];
    l_value_loss = [l_value_loss, l_value(m,n,A,b,x)];
    grad = gradient(m,n,A,b,x);
    ng = norm(grad, 2);
end
l_value_loss = l_value_loss - 0.318797;
fprintf("l(x*) = %.6f\n", l_value(m,n,A,b,x))
% plot(grad_norm);