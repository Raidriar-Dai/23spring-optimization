clear, close all
cvx_begin
    variable x(3);
    obj = (x(1)+x(2))^2 + x(2)^2 + x(3)^2 + 3*x(1) - 4*x(2);
    a = [sqrt(2)*(x(1)+0.25*x(2)), sqrt(31/8)*x(2), 2];

    minimize( obj );
    subject to
        norm( a ) + quad_over_lin( x(1)-x(2)+x(3)+1, x(1)+x(2) ) <= 6;
        x >= 1;
cvx_end

fprintf('Optimal solution is:')
x
