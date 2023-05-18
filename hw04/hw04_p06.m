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
