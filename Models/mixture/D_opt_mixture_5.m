%% Author: Chi-Kuang Yeh
% May 10 / 2017
% D optimality criterion
% Optimal designs for regression models using 2nd order LSE

%% function itself
function [del , ANS, error,pt] = D_opt_mixture_5(N1,N2,N3,N4,N5,t,theta,range,fun)    
  %% initialization
  
  counter = 0;
  % these ones are used in solving the question
  u1 = range(1)+(range(2)-range(1))*((1:N1)-1)/(N1-1); %discretized equally spaced space
  u2 = range(1)+(range(2)-range(1))*((1:N2)-1)/(N2-1); %discretized equally spaced space
  u3 = range(1)+(range(2)-range(1))*((1:N3)-1)/(N3-1); %discretized equally spaced space
  u4 = range(1)+(range(2)-range(1))*((1:N4)-1)/(N4-1); %discretized equally spaced space
  u5 = range(1)+(range(2)-range(1))*((1:N5)-1)/(N5-1); %discretized equally spaced space
  for i = 1:N1
    for j = 1:N2
      for k = 1:N3
        for l = 1:N4
          for m =1:N5
            if (u1(i)+u2(j)+u3(k)+u4(l)+u5(m)<=1)
              x (counter+1,:) = [u1(i);u2(j);u3(k);u4(l);u5(m)];
              counter = counter + 1;
            end
          end
        end
      end
    end
  end    
  pt = length(x);
  n = 15;%length(theta);
  w = zeros(length(x),1); del = 0 ; one_vec = ones(length(x),1);
  zero_vec = zeros(length(x),1);
  g1 = zeros(n,1); G2 = zeros(n);
  sqt = sqrt(t);
  
  %% cvx part
  cvx_begin quiet
    cvx_precision best
    variables w(length(x),1) del(1)%design variable and upper bound
    minimize del(1)
    subject to
%    constructing the B matrix
     for i = 1:length(x)
       %f = fun(x,theta);
       f = fun(x(i,:),theta);%[x(i,1);x(i,2);x(i,3);x(i,1)^2;x(i,2)^2;x(i,3)^2;x(i,1)*x(i,2);x(i,1)*x(i,3)];
       g1 = g1 + w(i)*f;
       G2 = G2 + w(i)*f*f';
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
  ANS = [x(kk,:)';w(kk)']; % return the answer

  % prepare the variables
   %BI = inv(B);
   
   %BI = 1/B;
   phi_D = zeros(length(x),1);
  for i = 1:length(x)
    f = fun(x(i,:),theta);
    I = [1 sqt*f' ; sqt*f  f*f'];
    phi_D(i) = trace(B\I);
  end
  q = (n+1)*ones(length(x),1);
  
  % update the error
  error = max(phi_D - q) ;
end