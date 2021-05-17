% Author : Chi-Kuang Yeh
% Date: 2017 Nov 15

% Purpose: To calculate the gradient of the function in
%   trignometric model of order n
function ANS = trig(xi, theta)
  n = length(theta);
  ANS = zeros(n, 1); p = (1:n / 2) .* xi;
  ANS(1:n / 2) = cos(p);
  ANS(n / 2 + 1:n) = sin(p);
end
