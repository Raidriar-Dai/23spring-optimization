function [x] = myCG(A, g, ng, CG_maxiter, tolerance)
% tolerance is a function handle: min(0.5,ng) or min(0.5,sqrt(ng)) or 0.5
x = 0; CG_tol = tolerance(ng) * ng;
r = g; p = -r;

for iter = 1:CG_maxiter
    rr = r'* r;
    Ap = A * p;
    alpha = rr / (p'*Ap);
    x = x + alpha * p;
    r = r + alpha * Ap; % r = Ax + g is residual
    nr1 = norm(r);
    if nr1 <= CG_tol
        break;
    end
    beta = nr1^2 / rr;
    p = -r + beta * p;
end

fprintf('CG_total_iter_number = %d\n', iter);
end
