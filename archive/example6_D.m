%% Author: Chi-Kuang Yeh
% May 10 / 2017
% Optimal designs for regression models using 2nd order LSE
% Example 6
% theta = [ a1 = 1; b1 =0.1 ;a2 =1 ;b2 =1.0] 

%% the example of usage
% [d ,a] = example6_D(101,0,[1 0.1 1 1]',1e-2)

%% function itself
function [del , ANS] = example6_D(N,t,theta,epsi)    
  %% initialization
  u = 50*((1:N)-1)/(N-1); %discretized equally spaced space
  w = zeros(N,1); del = 0;
  n = length(theta);
  g1 = zeros(n,1);G2 = zeros(n);

  %% cvx part
  cvx_begin quiet
    variables w(N,1) del(1)%design variable and upper bound
    minimize del(1)
    subject to
    % constructing the B matrix
      for i = 1:N
        f = ex6_f(u(i),theta);
        g1 = g1 + w(i)*f;
        G2 = G2 + w(i)*f*f';
      end
      B = [1 sqrt(t)*g1' ; sqrt(t)*g1 G2];
      % constrains
      -log_det(B) <= del;
      -w <= zeros(length(w),1);
      sum(w) == 1;
  cvx_end
  
  %% return the outputs
  kk = find(w>epsi); % because the computer does not have exact zero
  ANS = [u(kk);w(kk)']; % return the answer
  
  %% checking conditions, multiplicative algorithm
%   w2 = 1/N*ones(N,1);
%   while ( max( phi_D(w2) - n) > epsi)
%     for j=1:N
%       w2(j) = w2(j) *phi_D(w2) / n;
%     end
%   end
%   w2;
%    
%   A = G2 - t*g1*g1';
%   inv_A = inv(A);
%   for i = 1:N
%     f = exp_6(u(i));
%     phi(i) = (1-t) * f'*inv_A*f+t*(f-g1)'*inv_A*(f-g1);
%   end
%   while ( max( wi - n )>epsi)
%       wi = wi*
%   end
end