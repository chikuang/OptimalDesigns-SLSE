% Author : Chi-Kuang Yeh
% Date: 2018 Apr 1st

% Purpose: To calculate the gradient for mixture model
%

function ANS = mix_5(xi, theta)
  ANS = [xi(1); xi(2); xi(3); xi(4); xi(5); xi(1)^2; xi(2)^2; xi(3)^2; xi(4)^2; ...
        xi(5)^2; xi(1) * xi(2); xi(1) * xi(3); xi(4) * xi(5); xi(3) * xi(5); xi(2) * xi(5)];
end
