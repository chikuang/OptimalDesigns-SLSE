% Author : Chi-Kuang Yeh 
% Date: 2017 May 10th

% Purpose: To calculate the gradient of the function in M-M model
% Theta has dimension 2x1

function ANS = mm_try(xi,theta)
  par_a = xi./(xi+theta(2));     % partial derivative wrt a
  par_b = -(xi.*theta(1))./(xi+theta(2)).^2 ;% partial derivative wrt b
  ANS = [par_a ; par_b];
end
