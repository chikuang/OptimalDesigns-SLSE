% EMAX [1;2;1]
%D-optimality for Emax model

x = [101 501 1001 2001 3001 4001 5001 6001 7001 8001 9001 10001 20001 ...
  50001 80001 100001 200001 300001 400001 500001]';
y =  [1.922385 2.925531  3.935194  6.000104 8.367561 11.133859 13.606407...
 16.519683 19.700756 23.049704 30.974902 31.303157 82.123569 388.884111 ...
 877.657660 1339.919643 7090.714756 14685.702611 25868.178532 40175.861783]'; 

figure
  h1 = plot(x,y,'o-','linewidth',5,'markersize',14,'markerfacecolor','Red');
  xlabel({'Space partition','(N)'},'FontSize', 16); % x-axis label
  ylabel({'Computation time', '(in seconds)'},'FontSize', 16); % y-axis label