% Author : Chi-Kuang Yeh 
% Date: 2017 May 10th

% Purpose: To calculate the gradient of the function in M-M model
% Theta has dimension 2x1

function ANS = mm(xi,theta)
  ANS = [xi/(theta(2)+xi);  -(theta(1)*xi)/(theta(2)+xi).^2];
end
