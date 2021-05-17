function ANS = clau(xi, theta)
  ANS = [exp(theta(2)) * xi; theta(1) * xi * exp(theta(2) * xi)];
end
