% Author : Chi-Kuang Yeh 
% Date: 2018 Jan 18

% Fractional Polynomial Model
% E(y) = theta0+theta1*x^(1/2)+theta2*x^2
function ANS =poly_ex1(xi,theta)
  ANS = zeros(length(theta),1);
  ANS(:) = [xi;xi^(1/2);xi^2];
end
