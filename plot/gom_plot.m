x = 0:0.001:10;
f = @(x) exp(-exp(-x));
y = f(x);

figure
h1 = plot(x, y);
xlabel('design space ( S=[0,10] )', 'FontSize', 16); % x-axis label
ylabel('g(x;\theta)', 'FontSize', 16); % y-axis label
xlim([-0.5, 10.5]);
ylim([-0.05, 1.5]);
hold on

x1 = [0.000; 1.350; 10.0000];
y1 = [0; 0; 0];
h2 = plot(x1, y1, '*', 'Color', 'Red');
lgd = legend([h1 h2], 'g(x;\theta)', 'Support points');
lgd.FontSize = 16;
text(x1, y1 + 0.05, '$\frac{1}{3}$', 'Interpreter', 'latex', 'FontSize', 16);
hold off
