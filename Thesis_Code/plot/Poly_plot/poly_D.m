% [d , a, e] = D_opt(2001,0,zeros(5,1),[-1,+1],@poly)
sz =100;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% t = 0.0

x1= [ -1.0000   -0.7810   -0.4340    0.4340    0.7810    1.0000]';
y1 = [0.1980    0.1781    0.1238    0.1238    0.1781    0.1980]';
figure
  h1 = scatter(x1,y1,sz,'Red','*');
  xlabel('Design space','FontSize', 16); % x-axis label
  ylabel('Weight','FontSize', 16); % y-axis label
  xlim([-1.05,1.05]);
  ylim([0.00,0.30]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% t = 0.70;
x2=[ -1.0000   -0.7760   -0.3980    0.3980    0.7760    1.0000]';
y2=[  0.1926    0.1794    0.1280    0.1280    0.1794    0.1926]';

figure 
  h2 = scatter(x2,y2,sz,'*','Red');
  xlabel('Design space','FontSize', 16); % x-axis label
  ylabel('Weight','FontSize', 16); % y-axis label
  xlim([-1.05,1.05]);
  ylim([0.00,0.30]);