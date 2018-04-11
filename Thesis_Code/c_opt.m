function [del , ANS, error] = c_opt(N,t,theta,range,fun,c)    
  %% initialization
  u = range(1) + (range(2)-range(1))*((1:N)-1)/(N-1); %discretized equally spaced space
  w = zeros(N,1); del = 0; n = length(theta);
  g1 = zeros(n,1);G2 = zeros(n); C=[0,c']'; 
  one_vec = ones(N,1);zero_vec = zeros(N,1);
  sqt = sqrt(t);
  %% cvx part
  cvx_begin
    cvx_precision best
    variables w(N,1) del(1)
    minimize del(1)
    subject to
      % constructing the B matrix
      for i = 1:N
        f = fun(u(i),theta);
        g1 = g1+ w(i)*f;
        G2 = G2 + w(i)*f*f';
      end
      B = [1, sqt*g1';sqt*g1, G2];
      % the three constrains
      matrix_frac(C,B) <= del;
      -w <= zero_vec;
      one_vec' * w == 1;
  cvx_end
  
  %% checking condition
  BI = inv(B);
  phi_C = zeros(N,1);
  for i = 1:N
    f = fun(u(i),theta);
     I = [1, sqt*f';sqt*f, f*f'];
     phi_C(i) = trace(I*BI*C*C'*BI);
  end

  term = C'*BI*C;
  error = max(phi_C - term );
  
  %% manage the outputs
  kk = find(w>1e-4); 
  ANS = [u(kk);w(kk)']; 
  
  %% plotting
  new_range = [0;0]; add_dist = (range(2)-range(1))/20;
  new_range(1) = range(1) - add_dist;
  new_range(2) = range(2) + add_dist;
  
  % first plot, plot out the design points
  figure
    stem( u,w,'kd')
    xlim(new_range);  
    xlabel('design space','FontSize', 16) 
    ylabel('weight','FontSize', 16)
    title('Discretized weight distribution','FontSize', 20)
 
  % directional derivative plot
  fx = @(x) fun(x,theta);
  ff = @(x) trace([1 sqt*fx(x)' ; sqt*fx(x)  fx(x)*fx(x)'] *BI*C*C'*...
    BI)-term;
  
  figure
    h1=plot(u,phi_C-term*ones(N,1),'+'); %discretized
  hold on
    h2=fplot(ff,[range(1) range(2)],'-'); %function
  hold on
    line([range(1),range(2)],[0,0],'Color','red');
  hold on
    h3 = plot(u(kk),zeros(1,length(kk)),'pg'); %supporting points
    legend([h1 h2 h3], 'Discretized','d(x,\theta)','Supporting point');
    xlabel('design space','FontSize', 16); % x-axis label
    ylabel('Directional Derivative','FontSize', 16); % y-axis label
  hold off
end