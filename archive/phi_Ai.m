function  ANS  = phi_Ai(t,A,ui,g1,theta,fun)
  f = fun(ui,theta);
  inv_A = inv(A);
  inv_A2=inv_A*inv_A;
  fg1 = (f-g1);
  ANS = (1-t) * f' *  inv_A2* f + t* fg1' *inv_A2 * fg1;
end 