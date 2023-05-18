clear, close all
cvx_begin
    variable x(3)
    obj1 = norm([sqrt(2)*(x(1)+x(2)), x(2), x(3), sqrt(7)]);
    obj2 = square_pos(x(1)^2 + x(2)^2 + x(3)^2 + 1);

    minimize (obj1 + obj2);
    subject to
        quad_over_lin(x(1)+x(2), x(3)+1) + x(1)^8 <= 7;
        (x(1) + x(2) + x(3))^2 + 3*x(3)^2 <= 10;
        square_pos(abs(x(1)+x(2)-x(3))) <= 20;
        x >= 0;
cvx_end

fprintf('Optimal solution is:')
x