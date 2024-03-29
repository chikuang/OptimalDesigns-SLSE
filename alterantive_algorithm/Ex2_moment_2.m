%% Author: Chi-Kuang Yeh
% July 25 / 2017
% D-optimality criterion
% Optimal designs for regression models using 2nd order LSE

% [f, m]= D_moment_2(0, 2)
%% function itself
function [del, mu] = D_moment_2(t, ord)
  %% initialization
    
%   b = range(1); c = range(2);
  mu = zeros(2*ord, 1);
  %% cvx part
  cvx_begin quiet
  cvx_precision high
  variables mu(2*ord, 1) del(1) %design variable and upper bound
  minimize del(1)
  subject to
  % Constraint 1
  H = [1 0 mu(2); 0 mu(2) 0; mu(2) 0 mu(4)];
  H == semidefinite(ord + 1);
  % Constraint 2
  H1 = [1 0; 0 mu(2)]; H3 = [mu(2) 0; 0 mu(4)];
  H1 - H3 == semidefinite(ord);
  % Constraint 3
  B = [1 0 sqrt(t) * mu(2); 0 mu(2) 0; sqrt(t) * mu(2) 0 mu(4)];
  -log_det(B) <= del;
  cvx_end
