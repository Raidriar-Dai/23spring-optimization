clear, close all
cvx_begin
    variable x(4);
    minimize ( x(1)+x(2)+x(3)+x(4) );
    subject to
        (x(1) - x(2))^2 + (x(3)+2*x(4))^4 <= 5;
        x(1) + 2*x(2) + 3*x(3) + 4*x(4) <= 6;
        x >= 0;
cvx_end

fprintf('Optimal solution is:')
x