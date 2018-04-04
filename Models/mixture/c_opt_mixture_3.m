%% Author: Chi-Kuang Yeh
% Sep 11 / 2017
% C optimality criterion
% Optimal designs for regression models using 2nd order LSE

%% function itself
function [del , ANS, error,pt] = c_opt_mixture_3(N1,N2,N3,t,theta,range,fun,c)    
  %% initialization
   counter = 0;
  % these ones are used in solving the question
  u1 = range(1)+(range(2)-range(1))*((1:N1)-1)/(N1-1); %discretized equally spaced space
  u2 = range(1)+(range(2)-range(1))*((1:N2)-1)/(N2-1); %discretized equally spaced space
  u3 = range(1)+(range(2)-range(1))*((1:N3)-1)/(N3-1); %discretized equally spaced space
  for i = 1:N1
    for j = 1:N2
      for k = 1:N3
        if (u1(i)+u2(j)+u3(k)<=1)
          x(counter+1,:) = [u1(i);u2(j);u3(k)];
          counter = counter + 1;
        end
      end
    end
  end    
  pt = length(x);
  n = 8;%length(theta);
  w = zeros(length(x),1); del = 0; n = 8;%length(theta);
  g1 = zeros(n,1);G2 = zeros(n); C=[0,c]; one_vec = ones(length(x),1);
  zero_vec = zeros(length(x),1);
  %C is only used in C-optimality, for paramter combination
 
  %% cvx part
  cvx_begin quiet
    cvx_precision best
    variables w(length(x),1) del(1)%design variable and upper bound
    minimize del(1)
    subject to
      % constructing the B matrix
      for i = 1:length(x)
        f = fun(x(i,:),theta);
        g1 = g1+ w(i)*f;
        G2 = G2 + w(i)*f*f';
      end
      B = [1, sqrt(t)*g1';sqrt(t)*g1, G2];
      % the three constrains
      matrix_frac(C',B) <= del;
      %-w <= zeros(length(w),1);
      -w <= zero_vec;
      one_vec' * w == 1;
  cvx_end
  
  %% checking condition
  BI = inv(B);
  phi_C = zeros(length(x),1);
  for i = 1:length(x)
    f = fun(x(i,:),theta);
    I = [1, sqrt(t)*f';sqrt(t)*f, f*f'];
    phi_C(i) = trace(I*BI*C'*C*BI);
  end

  % update the error
  term = C*BI*C';
  error = max(phi_C - term );
  %% out the result
  kk = find(w>1e-4); % because the computer does not have exact zero
  ANS = [x(kk,:)';w(kk)']; % return the answer
end