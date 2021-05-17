% Author : Chi-Kuang Yeh 
% Date: 2017 Sep 20th

% Purpose: To calculate the gradient of the function in EMAX model
% Theta has dimension 3x1

function ANS = emax(xi,theta)
  deno = theta(2)+xi^theta(3);
  x_pow = xi^theta(3);
  par_1 = x_pow/deno;     % partial derivative wrt a
  par_2 = -theta(1)*x_pow/deno^2;
  par_3 = theta(1)*theta(2)*x_pow*log(xi)/deno^2;
  ANS = [par_1 ; par_2;par_3];
end
