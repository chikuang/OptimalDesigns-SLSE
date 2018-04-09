function ANS = spline(xi,theta)
  knot = max(0,(xi-theta(6)));
  ANS = [1,xi,xi^2,xi^3,knot^3,...
    -3*theta(5)*knot^2]';
end
