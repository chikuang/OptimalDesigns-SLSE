%% Author: Chi-Kuang Yeh
% Sep 11 / 2017
% C optimality criterion
% Optimal designs for regression models using 2nd order LSE

%% the examples used
% Compartment model with 2 compartments
% theta = [ a1 = 1; b1 =0.1 ;a2 =1 ;b2 =1.0] 
% range is from 0 to 50
% [d ,a,e] = C_opt_mod(101,0,[1 0.1 1 1]',[0;50],@comp_2,[3,2,4,5])

% Michaelis-Menten model
% theta = [ a=1 , b=1] 
% range is from 0 to 4
% [d ,a,e] = C_opt_mod(101,0,[1 1]',[0;4],@mm,[1/2,1/2])

% Compartment model with 8 compartments
%[d ,a,e]= C_opt(101,0,[1,0.1,1,0.6,1,2.3,1,5.5]',[0;10],@comp_4)

% polynomial model with degrees n and combination c in row vector
%[d ,a,e] =C_opt_mod(2001,t,zeros(n,1),[-1;1],@poly_draft,c)
%e.g. [d ,a,e] =C_opt_mod(2001,0.95,zeros(3,1),[-1;1],@poly_draft,[1/2,1/4,1/8])

%% function itself
function [del , ANS, error] = C_opt_mod(N,t,theta,range,fun,c)    
  %% initialization
  u = range(1) + (range(2)-range(1))*((1:N)-1)/(N-1); %discretized equally spaced space
  w = zeros(N,1); del = 0; n = length(theta);
  g1 = zeros(n,1);G2 = zeros(n); C=[0,c]; 
  %C is only used in C-optimality, for paramter combination
 
  %% cvx part
  cvx_begin quiet
    cvx_precision high
    variables w(N,1) del(1)%design variable and upper bound
    minimize del(1)
    subject to
      % constructing the B matrix
      for i = 1:N
        f = fun(u(i),theta);
        g1 = g1+ w(i)*f;
        G2 = G2 + w(i)*f*f';
      end
      B = [1, sqrt(t)*g1';sqrt(t)*g1, G2];
      % the three constrains
      matrix_frac(C',B) <= del;
      -w <= zeros(length(w),1);
      sum(w) == 1;
  cvx_end
  
  %% checking condition
  BI = inv(B);
  phi_C = zeros(N,1);
  for i = 1:N
    f = fun(u(i),theta);
     I = [1, sqrt(t)*f';sqrt(t)*f, f*f'];
     phi_C(i) = trace(I*BI*C'*C*BI);
  end

  % update the error
  term = C*BI*C';
  error = max(phi_C - term );
  %% out the result
  kk = find(w>1e-2); % because the computer does not have exact zero
  ANS = [u(kk);w(kk)']; % return the answer
  
  %% plot
  % first, we increase the graphing domain
  new_range = [0;0]; add_dist = (range(2)-range(1))/20;
  new_range(1) = range(1) - add_dist;
  new_range(2) = range(2) + add_dist;
  
  % first plot, plot out the design points
  figure
    stem( u,w,'kd')
    xlim(new_range);  % increase the domain, so the points wont be on the edge
    xlabel('design space','FontSize', 16) % x-axis label
    ylabel('weight','FontSize', 16) % y-axis label
    title('Discretized weight distribution','FontSize', 20)
 
  %directional derivative
  fx = @(x) fun(x,theta); sqt=sqrt(t);
  ff = @(x) trace([1 sqrt(t)*fx(x)' ; sqrt(t)*fx(x)  fx(x)*fx(x)'] *BI*C'*C*...
    BI)-term;
  
  figure
    plot(u,phi_C-term*ones(N,1),'+'); %discretized
  hold on
    fplot(ff,[range(1) range(2)],'-'); %function
  hold on
    plot(u(kk),zeros(1,length(kk)),'pg'); %supporting points
    legend('Discretized','d(x,\theta)','Supporting point');
    xlabel('design space','FontSize', 16); % x-axis label
    ylabel('Directional Derivative','FontSize', 16); % y-axis label
  hold on
    line([range(1),range(2)],[0,0],'Color','red');
  hold off
end