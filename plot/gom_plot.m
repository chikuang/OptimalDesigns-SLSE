x = 0:0.001:5;
f = @(x) exp(-2*exp(-3*x)); 
y = f(x);
figure
  h1 = plot(x,y);
  xlabel('design space (S)','FontSize', 16); % x-axis label
  ylabel('g(x;\theta)','FontSize', 16); % y-axis label
  ylim([-0.05,1.5]);
hold on
  x1 = [0.0650;0.5800;5.0000];
  h2 = plot(x1,[0;0;0,],'*','Color','Red');
  lgd = legend([h1 h2], 'g(x;\theta)','Support points');
  lgd.FontSize = 12;
hold off 