tim = 20;
tic
for i = 1:tim
    display('N is 51, t=0')
    [d , a, e] = D_opt(51,0,[1,2,3]',[0,5.0],@gompertz);
end
toc/tim
tic
  display('N is 51, t=0')
  [d , a, e] = D_opt(51,0,[1,2,3]',[0,5.0],@gompertz);
toc