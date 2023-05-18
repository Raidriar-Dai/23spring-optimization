%% Assignment 04 - 21307140003(Qirun Dai)

%% Problem 01
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

%% Problem 02
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

%% Problem 03
cvx_begin
    variable x(3)
    obj1 = abs(2*x(1) + 3*x(2) + x(3));
    obj2 = square_pos(norm(x));
    obj3 = norm([sqrt(2)*(x(1)+x(2)), sqrt(5)*(x(2)+1), 1]);

    minimize (obj1 + obj2 + obj3)
    subject to
        quad_over_lin([x(1), 1], x(2)) + 2*(x(1)+x(2)+0.5*x(3))^2 + 3*x(2)^2 + 19/2*x(3)^2 <= 7;
        max([x(1)+x(2), x(3), x(1)-x(3)]) <= 19;
        x(1) >= 0;
        x(2) >= 1;
cvx_end

fprintf('Optimal solution is:')
x

%% Problem 04
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

%% Problem 05
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

%% Problem 06
rand('seed',21307140003);
x=rand(40,1);
y=rand(40,1);
class=[2*x<y+0.5]+1;
A1=[x(find(class==1)),y(find(class==1))];
A2=[x(find(class==2)),y(find(class==2))];
plot(A1(:,1),A1(:,2),'*','MarkerSize',6)
hold on
plot(A2(:,1),A2(:,2),'d','MarkerSize',6)
hold on

x = [A1; A2];   % The set of all points.
b = [ones(21,1); -1*ones(19,1)];    % The set of corresponding labels.
cvx_begin
    variable w(3);
    minimize ( 0.5*(w(1)^2 + w(2)^2) );
    subject to
        for i=1:40
            b(i)*([w(1), w(2)]*x(i,:)' + w(3)) >= 1;
        end
cvx_end

fplot(@(x) -1/w(2)*(w(1)*x+w(3)), [0,1])
hold off
fprintf('The maximum-margin line is: %fx+%fy+%f = 0\n', w(1), w(2), w(3));

fprintf('Optimal solution is:')
w