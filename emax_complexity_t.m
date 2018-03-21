tic
  display('N is 1001, t=0')
  [d , a, e] = A_opt_mod(1001,0,[1;2;1],[1e-5;10],@emax);
toc

tic
  display('N is 1001, t=0.3')
  [d , a, e] = A_opt_mod(1001,0.3,[1;2;1],[1e-5;10],@emax);
toc

tic
  display('N is 1001, t=0.5')
  [d , a, e] = A_opt_mod(1001,0.5,[1;2;1],[1e-5;10],@emax);
toc

tic
  display('N is 1001, t=0.7')
  [d , a, e] = A_opt_mod(1001,0.7,[1;2;1],[1e-5;10],@emax);
toc

tic
  display('N is 1001, t=0.9')
  [d , a, e] = A_opt_mod(1001,0.9,[1;2;1],[1e-5;10],@emax);
toc

tic
  display('N is 5001, t=0')
  [d , a, e] = A_opt_mod(5001,0,[1;2;1],[1e-5;10],@emax);
toc

tic
  display('N is 5001, t=0.3')
  [d , a, e] = A_opt_mod(5001,0.3,[1;2;1],[1e-5;10],@emax);
toc

tic
  display('N is 5001, t=0.5')
  [d , a, e] = A_opt_mod(5001,0.5,[1;2;1],[1e-5;10],@emax);
toc

tic
  display('N is 5001, t=0.7')
  [d , a, e] = A_opt_mod(5001,0.7,[1;2;1],[1e-5;10],@emax);
toc

tic
  display('N is 5001, t=0.9')
  [d , a, e] = A_opt_mod(5001,0.9,[1;2;1],[1e-5;10],@emax);
toc
