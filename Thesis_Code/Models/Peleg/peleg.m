function ANS = peleg(xi,theta)
  deno = (theta(1)+xi*theta(2))^2;
  ANS = [-xi/deno ; -xi^2/deno];
end