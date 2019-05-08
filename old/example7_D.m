%% Author: Chi-Kuang Yeh
% May 10 / 2017
% Optimal designs for regression models using 2nd order LSE
% Example 7
% theta = [ a=1 , b=1] 

%% the example of usage
%[d ,a] = example7_D(101,0,[1 1]',1e-9)

%% function itself
function [del , ANS] = example7_D(N,t,theta,epsi)    
  %% initialization
  u = 4*((1:N)-1)/(N-1); %discretized equally spaced space
  w = zeros(N,1) ; del = 0;
  n = length(theta);
  g1 = zeros(n,1); G2 = zeros(n);
  
  cvx_begin quiet
    variables w(N,1) del(1)%design variable
    minimize del(1)
    subject to
      
      % constructing the B matrix
      for i = 1:N
        f = ex7_f(u(i),theta);
        g1 = g1 + w(i)*f;
        G2 = G2 + w(i)*f*f';
      end
      B = [1 sqrt(t)*g1' ; sqrt(t)*g1 G2];
      
      % three constains
      -log_det(B) <= del;
      -w <= zeros(length(w),1);
      sum(w) == 1;
  
  cvx_end

  %% return the outputs
  kk = find(w>1e-2); % because the computer does not have exact zero
  ANS = [u(kk);w(kk)'];
end