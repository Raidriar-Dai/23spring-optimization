clear, close all
cvx_begin
    variable x(3)
    obj0 = square_pos(quad_over_lin(x(1), x(2)) + quad_over_lin(x(2), x(1)));
    obj1 = abs(x(1)+5);
    obj2 = abs(x(2)+5);
    obj3 = abs(x(3)+5);

    minimize( obj0 + obj1 + obj2 + obj3 )
    subject to
        square_pos(square_pos(x(1)^2 + x(2)^2 + x(3)^2 + 1) + 1) + x(1)^4 + x(2)^4 + x(3)^4 <= 200;
        max([(x(1)+2*x(2))^2 + 5*x(2)^2, x(1), x(2)]) <= 40;
        x(1) >= 1;
        x(2) >= 1;
cvx_end

fprintf('Optimal solution is:')
x