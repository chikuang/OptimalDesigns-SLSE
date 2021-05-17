function ANS = logistic(xi, theta)
  ANS = [1 / (1 + theta(2) * exp(-theta(3) * xi));
      -theta(1) * exp(theta(3) * xi) / (theta(2) + exp(theta(3) * xi))^2;
      theta(1) * theta(2) * xi * exp(theta(3) * xi) / (theta(2) * exp(theta(3) * xi))^2];
end
