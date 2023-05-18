function [grad_norm, l_value_loss] = inexact_newton(dataset, alpha, beta, t0, tolerance)
% inexact newton method with 3 different tolerance rules;
% use newton_cg to get newton direction d;
% then apply Armijo line search to d to find optimal solution.
% alpha=0.3; beta=0.6; t0=1
% tolerance is a function handle: min(0.5,ng) or min(0.5,sqrt(ng)) or 0.5
% dataset = 'ijcnn1.test';
fprintf("inexact_newton: alpha=%.1f, beta=%.1f, t0=%.1f\n",alpha, beta, t0)
[b,A] = libsvmread(dataset);
[m,n] = size(A);

x = zeros(n,1);
grad_norm = [];
l_value_loss = [];

grad = gradient(m,n,A,b,x);
ng = norm(grad, 2);
while ng >= 1e-6
    H = Hessian(m,n,A,b,x);
    d = myCG(H, grad, ng, 1000, tolerance);
    t = backtracking_with_input_d(grad,d,m,n,A,b,x,t0,alpha,beta);
    x = x + t*d;
    grad_norm=[grad_norm,ng];
    l_value_loss = [l_value_loss, l_value(m,n,A,b,x)];
    grad = gradient(m,n,A,b,x);
    ng = norm(grad, 2);
end
l_value_loss = l_value_loss - 0.318797;
% plot(grad_norm);