clc, clear, close all;  

grad_norm_1 = GD_const(1);
plot(grad_norm_1);
hold on;

grad_norm_2 = GD_const(10);
plot(grad_norm_2);
hold on;

grad_norm_3 = GD_linesearch(0.3, 0.6, 10);
plot(grad_norm_3);
hold off;

legend('const: t=1', 'const: t=10', 'search: t=10');
