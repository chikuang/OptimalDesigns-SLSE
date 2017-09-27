% Author : Chi-Kuang Yeh 
% Date: 2017 May 10th

% Purpose: To calculate the gradient of the function in M-M model
% Theta has dimension 2x1

function ANS = mm(xi,theta)
  par_a = xi/(theta(2)+xi);     % partial derivative wrt a
  par_b = -(theta(1)*xi)/(theta(2)+xi).^2; % partial derivative wrt b
  ANS = [par_a ; par_b];
end
