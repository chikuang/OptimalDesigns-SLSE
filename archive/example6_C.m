%% Author: Chi-Kuang Yeh
% May 18 / 2017
% Optimal designs for regreession models using 2nd order LSE
% Example 6
% theta = [ a1 = 1; b1 =0.1 ;a2 =1 ;b2 =1.0] 

%% the example of usage
% [d ,a] = example6_C(101,0,[1 0.1 1 1]',1e-2)

%% function itself
function [del , ANS] = example6_C(N,t,theta,epsi)    
  %% initialization
  u = 50*((1:N)-1)/(N-1); %discretized equally spaced space
  w = zeros(N,1);
  n = length(theta);c=[0; ones(n,1)]; % c is only used for c-opt
  g1 = zeros(n,1);G2 = zeros(n); % use later
    
  %% cvx part
  cvx_begin quiet
      variables w(N,1) del(1)%design variable and upper bound
      minimize del(1)
      subject to
        % constructing the B matrix
        for i = 1:N
          f = ex6_f(u(i),theta);
          g1 = g1+w(i)*f;
          G2 = G2+ w(i)*f*f';
        end
        B = [1 sqrt(t)*g1' ; sqrt(t)*g1 G2];
        % the three constrains
        matrix_frac(c,B) <= del;
        -w <= zeros(length(w),1);
        sum(w) == 1;
  cvx_end
  
  %% out the result
  kk = find(w>1e-2); % because the computer does not have exact zero
  ANS = [u(kk);w(kk)']; % return the answer
end