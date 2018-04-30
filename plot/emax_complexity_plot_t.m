t = [0 0.3 0.5 0.7 0.9]';
%A opt with N =1001
A1001 = [2.870341 2.947939  2.832736  2.842263  2.853800]';
%A opt with N =5001
A5001 = [13.268557 13.599972 13.629027 13.413515 13.677847]'; 
%D opt with N =1001
D1001 = [4.513202 4.487485  4.592582 4.597348 4.663097]';

%D opt with N =5001
D5001 = [16.188163 16.217196 16.218664 15.991854 16.239503]';
figure
  h1 = plot(t,D1001,'o-','linewidth',5,'markersize',14,'markerfacecolor','Red');
  xlabel('t','FontSize', 16); % x-axis label
  ylabel({'Computation time', '(in seconds)'},'FontSize', 16); % y-axis label
  xlim([0, 1]);
  ylim([0, max(D1001)*1.5]);
figure
  h2 = plot(t,D5001,'o-','linewidth',5,'markersize',14,'markerfacecolor','Red');
  xlabel('t','FontSize', 16); % x-axis label
  ylabel({'Computation time', '(in seconds)'},'FontSize', 16); % y-axis label
  xlim([0, 1]);
  ylim([0, max(D5001)*1.5]);
figure
  h3 = plot(t,A1001,'o-','linewidth',5,'markersize',14,'markerfacecolor','Red');
  xlabel('t','FontSize', 16); % x-axis label
  ylabel({'Computation time', '(in seconds)'},'FontSize', 16); % y-axis label
  xlim([0, 1]);
  ylim([0, max(A1001)*1.5]);
figure
  h4 = plot(t,A5001,'o-','linewidth',5,'markersize',14,'markerfacecolor','Red');
  xlabel('t','FontSize', 16); % x-axis label
  ylabel({'Computation time', '(in seconds)'},'FontSize', 16); % y-axis label
  xlim([0, 1]);
  ylim([0, max(A5001)*1.5]);