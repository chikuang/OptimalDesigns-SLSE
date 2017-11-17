% Author : Chi-Kuang Yeh 
% Date: 2017 July 10th

% Purpose: To calculate the gradient of the function in
%   polynomial model of order n
function ANS =poly(xi,theta)
   ANS = zeros(length(theta), length(xi));
  for i = 1 : length(xi)
    ANS(:,i) = xi(i).^(1:length(theta));
  end
end
