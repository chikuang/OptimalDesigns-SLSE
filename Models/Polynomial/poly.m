% Author : Chi-Kuang Yeh 
% Date: 2017 July 10th

% Purpose: To calculate the gradient of the function in
%   polynomial model of order n

%[d ,a,e] = A_opt_mod(101,0,zeros(n,1),[0;1],@poly)
%[d ,a,e] = D_opt_mod(101,0,zeros(n,1),[-1;1],@poly)
function ANS =poly(xi,theta)
  n = length(theta); %the order of the polynomial
  ANS = zeros(n,1);
  for i = 1:n
    ANS(i,1) = xi.^i;
  end
end
