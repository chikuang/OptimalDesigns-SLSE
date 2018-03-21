x = [101 501 1001 2001 3001 4001 5001 6001 7001 8001 9001 10001 20001 ...
  50001 80001 100001 200001 500001]';
y = [1.947655 3.142738 4.371588 6.787402 9.554942  12.638010  15.777570 ...
  19.056546 22.388693  25.826660  29.544590  33.121448 88.168181 ...
407.208321 1053.577077 1518.140686 6802.847411 40030.357365]';

figure
  h1 = plot(x,y,'o-','linewidth',5,'markersize',14,'markerfacecolor','Red');
  xlabel({'Space partition','(N)'},'FontSize', 16); % x-axis label
  ylabel({'complexity', '(in seconds)'},'FontSize', 16); % y-axis label
  %xlim([-0.05,]);
  %ylim([-0.05,1.5]);
%hold on
%  x1 = [0.0645;0.5790;5.0000];
%  y1 = [0;0;0];
%  h2 = plot(x1,y1,'*','Color','Red');
%  lgd = legend([h1 h2], 'g(x;\theta)','Support points');
%  lgd.FontSize = 16;
%  text(x1,y1+0.05,'$\frac{1}{3}$','Interpreter','latex','FontSize',16);
%hold off 