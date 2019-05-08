%% Author: Chi-Kuang Yeh
% May 19 / 2017
% Optimal designs for regreession models using 2nd order LSE
% Example 6
% theta = [ a1=1.0, b1=0.1, a2=1, b2 = 1] 

%% the example of usage
% [d , a] = example6_A(101,0,[1,0.1,1,1]',1e-9)

%% function itself
function [del , ANS] = example6_A(N,t,theta,epsi)    
  %% initialization
  u = 50*((1:N)-1)/(N-1); %discretized equally spaced space
  w = zeros(N,1); n = length(theta);
  C = [zeros(n,1) eye(n)]'; % each column is a ci which we used later
  %c1=[0,1,0,0,0]'; c2 =[0,0,1,0,0]';c3=[0,0,0,1,0]'; c4=[0,0,0,0,1]';
  
  g1 = zeros(n,1) ; G2 = zeros(n) ;  obj_val = 0;
    
  %% cvx part
  cvx_begin quiet
    variables w(N,1) del(1)%design variable
    minimize del(1)
    subject to
      for i = 1:N
        f = ex6_f(u(i),theta);
        g1 = g1 + w(i)*f;
        G2 = G2 + w(i)*f*f';
      end
      B = [1 sqrt(t)*g1' ; sqrt(t)*g1 G2];
      % three constains
      for k = 1:n
        obj_val = obj_val + matrix_frac(C(:,k),B) ;
      end
      obj_val <= del;
      %matrix_frac(c1,B)+matrix_frac(c2,B)+matrix_frac(c3,B)+matrix_frac(c4,B) <= del;
      -w <= zeros(length(w),1);
      sum(w) == 1;
  cvx_end
  
  %% manage the outputs
  kk = find(w > 1e-2); % because the computer does not have exact zero
  ANS = [u(kk) ; w(kk)'];
end