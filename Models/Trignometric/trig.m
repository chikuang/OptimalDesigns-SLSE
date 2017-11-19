% Author : Chi-Kuang Yeh 
% Date: 2017 Nov 15

% Purpose: To calculate the gradient of the function in
%   trignometric model of order n
function ANS = trig(xi,theta)
  ANS = zeros(length(theta),1);
  h = length(theta)/2;
  for i = 1:h
    ANS(i,1) = cos(i*xi);   % first half is all cos
    ANS(i+h,1) = sin(i*xi); % second half is all sin
  end
end
