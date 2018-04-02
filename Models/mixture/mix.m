% Author : Chi-Kuang Yeh 
% Date: 2018 Apr 1st

% Purpose: To calculate the gradient for mixture model
% 

function ANS = mix(xi,theta)
  ANS = zeros(length(theta),1);
  ANS = [xi(1);xi(2);xi(3);xi(1)^2;xi(2)^2;xi(3)^2;xi(1)*xi(2);xi(1)*xi(3)];
end
