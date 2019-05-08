function  ANS  = phi_Di(t,A,ui,g1,theta,fun)
  f = fun(ui,theta);
  inv_A = inv(A);
  fg1 = (f-g1);
  ANS = (1-t) * f' *  inv_A * f + t* fg1' *inv_A * fg1;
end 