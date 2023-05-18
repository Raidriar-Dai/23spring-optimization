clear, close all

dataset = 'a9a.test';

[grad_norm_exact, l_value_loss_exact] = newton(dataset, 0.3, 0.6, 1);

tolerance_1 = @(ng) min([0.5, ng]);
tolerance_2 = @(ng) min([0.5, sqrt(ng)]);
tolerance_3 = @(ng) 0.5;
[grad_norm_1, l_value_loss_1] = inexact_newton(dataset, 0.3, 0.6, 1, tolerance_1);
[grad_norm_2, l_value_loss_2] = inexact_newton(dataset, 0.3, 0.6, 1, tolerance_2);
[grad_norm_3, l_value_loss_3] = inexact_newton(dataset, 0.3, 0.6, 1, tolerance_3);

[grad_norm_gd, l_value_loss_gd] = GD_linesearch_2(dataset, 0.3, 0.6, 5);

plot(grad_norm_exact)
hold on
plot(grad_norm_1)
hold on
plot(grad_norm_2)
hold on
plot(grad_norm_3)
hold on
plot(grad_norm_gd)
legend('exact newton', 'inexact tolerance 1', 'inexact tolerance 2', 'inexact tolerance 3', ...
    'GD line search')
hold off

figure

plot(l_value_loss_exact)
hold on
plot(l_value_loss_1)
hold on
plot(l_value_loss_2)
hold on
plot(l_value_loss_3)
hold on
plot(l_value_loss_gd)
legend('exact newton', 'inexact tolerance 1', 'inexact tolerance 2', 'inexact tolerance 3', ...
    'GD line search')
hold off