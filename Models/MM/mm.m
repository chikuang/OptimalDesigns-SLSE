function ANS = mm(xi,theta)
  ANS = [xi/(theta(2)+xi);  -(theta(1)*xi)/(theta(2)+xi).^2];
end
