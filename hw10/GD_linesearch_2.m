function [grad_norm, l_value_loss] = GD_linesearch_2(dataset, alpha, beta, t0)
% alpha = 0.3; beta = 0.6; t0 = 10
% dataset = 'ijcnn1.test';
fprintf("GD_line_search: alpha=%.1f, beta=%.1f, t0=%.1f\n",alpha, beta, t0)

[b,A] = libsvmread(dataset);
[m,n] = size(A);
mu = 1e-2/m;

x=zeros(n,1);
grad_norm = zeros(1000);
l_value_loss = zeros(1000);

for i = 1:1000
    grad = gradient(m,n,A,b,x);
    ng = norm(grad,2);
    t = backtracking(grad,m,n,A,b,x,t0,alpha,beta);
    x = x - t*grad;
    grad_norm(i) = ng;
    l_value_loss(i) = l_value(m,n,A,b,x);
    fprintf("Iteration = %d; grad_norm = %.6e;\n", i, grad_norm(i));
    if grad_norm(i) < 1e-4
        break
    end
end
l_value_loss = max(l_value_loss - 0.318797, zeros(1000));
fprintf("GD_line_search_t=%.2f; Num_Iter = %d\n", t, i);
% plot(grad_norm);