% Author : Chi-Kuang Yeh 
% Date: 2017 Oct 1st

% Purpose: To calculate the gradient of the function in
%   fractional polynomial model of order n
function ANS =half_frac_poly(xi,theta)
  ANS = zeros(length(theta),1);
  ANS(:) = (xi^(1/2)).^(1:length(theta));
end
