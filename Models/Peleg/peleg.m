<<<<<<< HEAD
% Author : Chi-Kuang Yeh 
% Date: 2018 March 18th

% Purpose: To calculate the gradient of the function in
%   Peleg model of order n
function ANS = peleg(xi,theta)
  deno = (theta(1)+xi*theta(2))^2;
  ANS = [-xi/deno ; -xi^2/deno];
end
=======
% Author : Chi-Kuang Yeh 
% Date: 2018 March 18th

% Purpose: To calculate the gradient of the function in
%   Peleg model of order n
function ANS = peleg(xi,theta)
  deno = (theta(1)+xi*theta(2))^2;
  ANS = [-xi/deno ; -xi^2/deno];
end
>>>>>>> ebe5638a4a3befe7406b727f3cfb5ecc35c2cbfa
