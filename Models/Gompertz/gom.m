% Author : Chi-Kuang Yeh 
% Date: 2018 Jan 28th

% Purpose: To calculate the gradient of the function in
%   gompertz growth model
function ANS =gom(xi,theta)
  a = exp(-theta(2)*exp(-theta(3)*xi));
  b = theta(1)*exp(-theta(2)*exp(-theta(3)*xi)-theta(3)*xi);
  c = theta(1)*theta(2)*xi*exp(-theta(2)*...
    exp(-theta(3)*xi)-theta(3)*xi);
  ANS = [a;b;c];
end
