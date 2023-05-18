m = 16; n = 8;
A = mat;    % m*n
b = vec;    % m*1

bnds = vec2;
l = min(bnds, [], 2);
u = max(bnds, [], 2);

cvx_begin
    variable x(n);   % n*1
    minimize (norm(A*x - b));
    subject to
        l <= x <= u;
cvx_end
