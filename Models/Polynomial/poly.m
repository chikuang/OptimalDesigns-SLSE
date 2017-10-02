% Author : Chi-Kuang Yeh 
% Date: 2017 July 10th

% Purpose: To calculate the gradient of the function in
%   polynomial model of order n
function ANS =poly(xi,theta)
  n = length(theta); %the order of the polynomial
  ANS = zeros(n,1);
  for i = 1:n
    ANS(i,1) = xi.^i;
  end
end
