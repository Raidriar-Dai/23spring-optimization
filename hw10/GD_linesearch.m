function grad_norm = GD_linesearch(alpha, beta, t0)
% alpha = 0.3; beta = 0.6; t0 = 10
fprintf("GD_line_search: alpha=%.1f, beta=%.1f, t0=%.1f\n",alpha, beta, t0)
rand('seed', 21307140003);
m=500; n=1000;
A=randn(m,n); b=sign(rand(m,1)-0.5);

x = zeros(n,1);
grad_norm = zeros(3000);

for i = 1:3000
    grad = gradient(m,n,A,b,x);
    ng = norm(grad,2);
    t = backtracking(grad,m,n,A,b,x,t0,alpha,beta);
    x = x - t*grad;
    grad_norm(i) = ng;
    fprintf("Iteration = %d; grad_norm = %.6e;\n", i, grad_norm(i));
    if grad_norm(i) < 1e-4
        break
    end
end

fprintf("GD_line_search_t=%.2f; Num_Iter = %d\n", t, i);

























