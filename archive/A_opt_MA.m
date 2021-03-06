%% Author: Chi-Kuang Yeh
% May 26 / 2017
% Optimal designs for regression models using 2nd order LSE
% Example 6
% Using the Multiplicative algorithms
% theta = [ a1 = 1; b1 =0.1 ;a2 =1 ;b2 =1.0] 

%% the example used
% [d ,a] = A_opt_MA(101,0,[1 0.1 1 1]',1e-2,[0,50],@ex6_f)

function  [obj , ANS]  = A_opt_MA(N,t,theta,epsi,range,fun)
   %% initialization
  u = (range(2)-range(1))*((1:N)-1)/(N-1); %discretized equally spaced space
  n = length(theta);
  g1 = zeros(n,1); G2 = zeros(n);
 
 %% Multiplicative algorithm part
 
 % defining variables
  w = 1/N*ones(N,1); % initiailizing the weight
  phi_A = zeros(N,1);  obj = 0; ANS = 0;
  q = n; % redundant
  %condition = true;
 
  % updating till (15) is satisfied
  %while(condition)
  while( true ) 
   % compute A matrix first
    for i = 1:N
      f = fun(u(i),theta);
      g1 = g1 + w(i)*f;
      G2 = G2 + w(i) * f * f';
    end
    A = G2 - t * g1 * g1';

    %inv_A = inv(A);
    for i = 1:N
      phi_A(i) =  phi_Ai(t,A,u(i),g1,theta,fun); % w is the same for all A & g1
    end

    %abs( max(phi_D - q) ) % why stock at 2.2493, and it is increasing???
    %if( abs( max(phi_D - q) )< 1e-9) % if the condition is satisfied, we stop
    tra = trace( inv(A) );
    if( max(phi_A - tra) < 1e-9)
      % manage the outputs
      obj =  -log(det(A)); 
      kk = find(w>epsi);
      ANS = [u(kk);w(kk)'];
      %condition = false;
      break;
    else % otherwise we update the weights
      w = w .*phi_A / tra;
    end
  end
end