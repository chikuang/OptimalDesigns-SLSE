N = [51, 101, 501, 1001, 2001, 5001]';
Loss = [7.9183 7.9175 7.9163 7.9162 7.9162 7.9162];
figure
h1 = plot(N, Loss, 'o-', 'linewidth', 5, 'markersize', 14, 'markerfacecolor', 'Red');
xlabel({'Number of design points', '(N)'}, 'FontSize', 16); % x-axis label
ylabel('Loss function', 'FontSize', 16); % y-axis label
ylim([min(Loss) - 0.002, max(Loss) + 0.002]);
