x = 0:0.001:5;
f = @(x) exp(-2*exp(-3*x)); 
y = f(x);
figure
  h1 = plot(x,y);
  xlabel('design space (S)','FontSize', 16); % x-axis label
  ylabel('g(x;\theta)','FontSize', 16); % y-axis label
  xlim([-0.05,5.5]);
  ylim([-0.05,1.5]);
hold on
  x1 = [0.0645;0.5790;5.0000];
  y1 = [0;0;0];
  h2 = plot(x1,y1,'*','Color','Red');
  lgd = legend([h1 h2], 'g(x;\theta)','Support points');
  lgd.FontSize = 12;
  text(x1-0.08,y1+0.1,'$\frac{1}{3}$','Interpreter','latex','FontSize',14);
hold off 