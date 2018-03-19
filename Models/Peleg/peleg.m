% Author : Chi-Kuang Yeh 
% Date: 2018 March 18th

% Purpose: To calculate the gradient of the function in
%   Peleg model of order n
function ANS = peleg(xi,theta)
  deno = (theta(1)+xi*theta(2))^2;
  ANS = [-xi/deno ; -xi^2/deno];
end
