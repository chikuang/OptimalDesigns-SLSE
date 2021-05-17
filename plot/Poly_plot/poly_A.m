%[d , a, e] = A_opt_mod(2001,0,zeros(5,1),[-1,+1],@poly)
sz = 100;
col = 'Blue';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% t = 0.00

x1 = [-1.0000 -0.7960 -0.3310 0.3310 0.7960 1.0000]';
y1 = [0.0804 0.1863 0.2333 0.2333 0.1863 0.0804]';
figure
h1 = scatter(x1, y1, sz, col, '*');
xlabel('Design space', 'FontSize', 16); % x-axis label
ylabel('Weight', 'FontSize', 16); % y-axis label
xlim([-1.05, 1.05]);
ylim([0.00, 0.30]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% t = 0.70;
%[d , a, e] = A_opt(2001,0.70,zeros(5,1),[-1,+1],@poly)

x2 = [-1.0000 -0.7950 -0.3260 0.3260 0.7950 1.0000]';
y2 = [0.0829 0.1918 0.2253 0.2253 0.1918 0.0829]';
figure
h2 = scatter(x2, y2, sz, '*', col);
xlabel('Design space', 'FontSize', 16); % x-axis label
ylabel('Weight', 'FontSize', 16); % y-axis label
xlim([-1.05, 1.05]);
ylim([0.00, 0.30]);
