% Author : Chi-Kuang Yeh 
% Date: 2017 July 10th

% Purpose: To calculate the gradient of the function in
%   polynomial model of order n
function ANS =poly(xi,theta)
  ANS = zeros(length(theta),1);
  ANS(:) = xi.^(1:length(theta));
end
