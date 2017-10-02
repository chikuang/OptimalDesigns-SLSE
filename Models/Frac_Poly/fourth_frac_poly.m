% Author : Chi-Kuang Yeh 
% Date: 2017 Oct 1st

% Purpose: To calculate the gradient of the function in
%   fractional polynomial model of order n
function ANS =fourth_frac_poly(xi,theta)
  n = length(theta); 
  ANS = zeros(n,1);
  for i = 1:n
    ANS(i,1) = (xi^(1/4)).^i;
  end
end
