% [d , a, e] = D_opt_mod(2001,0,zeros(5,1),[-1,+1],@poly)
sz =100;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% t = 0.0

x1= [ -1.0000   -0.7810   -0.4340    0.4340    0.7810    1.0000]';
y1 = [0.1980    0.1781    0.1238    0.1238    0.1781    0.1980]';
figure
  h1 = scatter(x1,y1,sz,'Red','*');
  xlabel('Design space ( S=[-1,+1] )','FontSize', 16); % x-axis label
  ylabel('Weight','FontSize', 16); % y-axis label
  xlim([-1.05,1.05]);
  ylim([0.00,0.30]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% t = 0.35;
x2=[-1.0000   -0.7670    -0.3090    0.3090    0.7670    1.0000]';
y2=[ 0.1737    0.1717     0.1546    0.1546    0.1717    0.1737]';
%x2 = [-1.0000   -0.7800   -0.4260    0.4260    0.7800    1.0000]';
%y2 = [ 0.1969    0.1786    0.1246    0.1246    0.1786    0.1969]';
figure 
  h2 = scatter(x2,y2,sz,'*','Red');
  xlabel('Design space ( S=[-1,+1] )','FontSize', 16); % x-axis label
  ylabel('Weight','FontSize', 16); % y-axis label
  xlim([-1.05,1.05]);
  ylim([0.00,0.30]);

% 
%    
%   x1 = [0.0645;0.5790;5.0000];
%   y1 = [0;0;0];
%   h2 = plot(x1,y1,'*','Color','Red');
%   lgd = legend([h1 h2], 'g(x;\theta)','Support points');
%   lgd.FontSize = 16;
%   text(x1,y1+0.05,'$\frac{1}{3}$','Interpreter','latex','FontSize',16);
% hold off 