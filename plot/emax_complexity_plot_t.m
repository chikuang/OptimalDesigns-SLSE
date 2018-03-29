t = [0 0.3 0.5 0.7 0.9]';
%A opt with N =1001
A1001 = [2.762953 2.770345 2.779268 2.683086 2.645688]';
%A opt with N =5001
A5001 = [14.339726 13.588190 14.018942  13.511677 13.508004]';
%D opt with N =1001
D1001 = [4.189248 4.136878 4.127095 4.276539 4.125098]';

%D opt with N =5001
D5001 = [15.256286 15.633771 15.509519 15.596103 15.864564]';
figure
  h1 = plot(t,D1001,'o-','linewidth',5,'markersize',14,'markerfacecolor','Red');
  xlabel({'level of asymmetry','(t)'},'FontSize', 16); % x-axis label
  ylabel({'complexity', '(in seconds)'},'FontSize', 16); % y-axis label
  xlim([0, 1]);
  ylim([0, max(D1001)*1.3]);
figure
  h2 = plot(t,D5001,'o-','linewidth',5,'markersize',14,'markerfacecolor','Red');
  xlabel({'level of asymmetry','(t)'},'FontSize', 16); % x-axis label
  ylabel({'complexity', '(in seconds)'},'FontSize', 16); % y-axis label
  xlim([0, 1]);
  ylim([0, max(D5001)*1.3]);
figure
  h3 = plot(t,A1001,'o-','linewidth',5,'markersize',14,'markerfacecolor','Red');
  xlabel({'level of asymmetry','(t)'},'FontSize', 16); % x-axis label
  ylabel({'complexity', '(in seconds)'},'FontSize', 16); % y-axis label
  xlim([0, 1]);
  ylim([0, max(A1001)*1.3]);
figure
  h4 = plot(t,A5001,'o-','linewidth',5,'markersize',14,'markerfacecolor','Red');
  xlabel({'level of asymmetry','(t)'},'FontSize', 16); % x-axis label
  ylabel({'complexity', '(in seconds)'},'FontSize', 16); % y-axis label
  xlim([0, 1]);
  ylim([0, max(A5001)*1.3]);