function [del , ANS, error] = D_opt(N,t,theta,range,fun)    
  %% initialization
  % discretized equally spaced space
  u = range(1)+(range(2)-range(1))*((1:N)-1)/(N-1); 
  w = zeros(N,1); n = length(theta); del = 0 ; 
  one_vec = ones(N,1);zero_vec = zeros(N,1);
  g1 = zeros(n,1); G2 = zeros(n);
  sqt = sqrt(t);
  
  %% cvx part
  cvx_begin quiet
    cvx_precision best
    variables w(N,1) del(1)
    minimize del(1)
    subject to
    % constructing the B matrix
     for i = 1:N
       f = fun(u(i),theta);
       g1 = g1 + w(i)*f;
       G2 = G2 + w(i)*f*f';
     end
     B = [1 sqt*g1' ; sqt*g1 G2];

      % constrains
      -log_det(B) <= del;
      -w <= zero_vec;
      one_vec' * w == 1;
  cvx_end
  
  %% manage the outputs
  kk = find(w>1e-4); % 
  ANS = [u(kk);w(kk)'];

  % prepare the variables
  phi_D = zeros(N,1);
  for i = 1:N
    f = fun(u(i),theta);
    I = [1 sqt*f' ; sqt*f  f*f'];
    phi_D(i) = trace(B\I);
  end
  q = (n+1)*ones(N,1);
  
  error = max(phi_D - q) ;
  
  %% plotting
  new_range = [0;0]; add_dist = (range(2)-range(1)) /20;
  new_range(1) = range(1) - add_dist;
  new_range(2) = range(2) + add_dist;
  
  % first plot, plot out the design points
  figure
    stem( u,w,'kd');
    xlim(new_range); 
    ylim([0,1]);
    xlabel('design space','FontSize', 16) % x-axis label
    ylabel('weights','FontSize', 16) % y-axis label
    title('Discretized weight distribution','FontSize', 20)
  
  % directional derivative plot
  fx = @(x) fun(x,theta);
  ff = @(x) trace(B\[1 sqt.*fx(x)' ; sqt.*fx(x)  fx(x)*fx(x)'] ) - (n+1);
  
  mini = min(phi_D-q);
  figure
    h1 = plot(u,phi_D-q,'+'); 
    xlim(new_range);
    ylim([mini+mini/10,1]);
  hold on
    y = zeros(size(u));
    for i =  1:length(u)
      y(i) = ff(u(i));
    end
    h2 = plot(u,y,'-'); 
  hold on
    line(new_range,[0,0],'Color','blue','LineStyle','--');
  hold on
    h3 = plot(u(kk),zeros(1,length(kk)),'pg'); 
    legend([h1 h2 h3], 'Discretized','d(x,\theta)','Supporting point');
    xlabel('design space','FontSize', 16) 
    ylabel('Directional Derivative','FontSize', 16) 
  hold off
end