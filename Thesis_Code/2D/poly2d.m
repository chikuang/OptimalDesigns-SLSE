% Author : Chi-Kuang Yeh 
% Date: 2017 Sep 20th

% Purpose: To calculate the gradient of the function in EMAX model
% Theta has dimension 3x1

function ANS = poly2d(xi,yi,theta)
  ANS = [xi;yi;xi*yi];
end
