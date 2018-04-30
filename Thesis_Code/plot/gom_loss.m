N =[51, 101, 501, 1001, 2001, 5001 ]';
Loss = [11.1203, 11.1058,  11.1005, 11.1002, 11.1002, 11.1002];
figure
  h1 = plot(N,Loss,'o-','linewidth',5,'markersize',14,'markerfacecolor','Red');
  xlabel({'Number of design points','(N)'},'FontSize', 16); % x-axis label
  ylabel('Loss function','FontSize', 16); % y-axis label
  ylim([11.09,max(Loss)+0.02]);