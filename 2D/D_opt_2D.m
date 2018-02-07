%% Author: Chi-Kuang Yeh
% Feburary 06/ 2018
% D optimality criterion
% Optimal designs for regression models using 2nd order LSE
% Multi-Dimension

%% function itself
function [del , ANS, error] = D_opt_2D(N1,N2,t,theta,range1,range2,fun)    
  %% initialization
  
  % these ones are used in solving the question
  N = N1*N2;
  u = range1(1)+(range1(2)-range1(1))*((1:N1)-1)/(N1-1); %discretized equally spaced space
  v = range2(1)+(range2(2)-range2(1))*((1:N2)-1)/(N2-1);
  w = zeros(N,1); n = length(theta); del = 0 ; one_vec = ones(N,1);zero_vec = zeros(N,1);
  g1 = zeros(n,1); G2 = zeros(n);
  sqt = sqrt(t);
  
  %% cvx part
  cvx_begin
    cvx_precision best
    variables w(N,1) del(1)%design variable and upper bound
    minimize del(1)
    subject to
%    constructing the B matrix
     for i = 1:N1
       for j =1:N2
         f = fun(u(i),v(j),theta); %probably modify here, add v(i) in
         g1 = g1 + w(i)*f;
         G2 = G2 + w(i)*f*f';
       end
     end
     B = [1 sqt*g1' ; sqt*g1 G2];

      % constrains
      -log_det(B) <= del;
      %-w <= zeros(length(w),1);
      -w <= zero_vec;
      one_vec' * w == 1;
  cvx_end
  
  %% propose the outputs
  kk = find(w>1e-4); % because the computer does not have exact zero
  ANS = [u(kk);w(kk)']; % return the answer
  
   phi_D = zeros(N,1);
  for i = 1:N1
    for j=1:N2
      f = fun(u(i),v(j),theta);
      I = [1 sqt*f' ; sqt*f  f*f'];
      %phi_D(i) = trace( BI*I) ;
      phi_D(i) = trace(B\I);
    end
  end
  q = (n+1)*ones(N,1);
  
  % update the error
  error = max(phi_D - q) ;
end