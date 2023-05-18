clear, close all
cvx_begin
    variable x(3)
    obj1 = abs(2*x(1) + 3*x(2) + x(3));
    obj2 = square_pos(norm(x));
    obj3 = norm([sqrt(2)*(x(1)+x(2)), sqrt(5)*(x(2)+1), 1]);

    % A = [2,2,1; 2,5,1; 1,1,10];

    minimize (obj1 + obj2 + obj3)
    subject to
        quad_over_lin([x(1), 1], x(2)) + 2*(x(1)+x(2)+0.5*x(3))^2 + 3*x(2)^2 + 19/2*x(3)^2 <= 7;
        max([x(1)+x(2), x(3), x(1)-x(3)]) <= 19;
        x(1) >= 0;
        x(2) >= 1;
cvx_end

fprintf('Optimal solution is:')
x
