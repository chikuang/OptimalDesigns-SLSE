% Author : Chi-Kuang Yeh 
% Date: 2017 May 10th

% Purpose: To calculate the gradient of the function in M-M model
% Theta has dimension 2x1

function ANS = mm_trans(xi,theta)
  S = 1/(theta(2) +xi);   % re-scaling
  ANS= [ 1-S*theta(2) ; -S*theta(1)+theta(1)*theta(2)*S^2]; %partial derivative wrt S
end
