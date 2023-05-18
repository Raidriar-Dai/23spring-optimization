function grad_norm = GD_const(t)
fprintf("GD_const: t = %.2f\n",t)
rand('seed', 21307140003);
m = 500; n = 1000;
A = randn(m,n); b = sign(rand(m,1)-0.5);

x = zeros(n,1);
grad_norm = zeros(3000);

for i=1:3000
    grad = gradient(m,n,A,b,x);
    x = x-t*grad;
    grad_norm(i) = norm(grad,2);
    fprintf("Iteration = %d; grad_norm = %.6e;\n", i,grad_norm(i));
    if grad_norm(i) < 1e-4
        break
    end
end

fprintf("GD_const_t=%.2f; Num_Iter = %d\n", t, i);