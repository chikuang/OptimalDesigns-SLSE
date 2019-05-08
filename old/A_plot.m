the = [1 1]';
t=0;
N=101; tor = 1e-4;ran = [0;4];
fun = @ex7_f;
[d ,a] = A_opt(N,t,the,tor,ran,fun);

u = a(2,:); w = a(1,:);
for i = 1:N
    f = fun(u(i),theta);
    g1 = g1 + w(i)*f;
    G2 = G2 + w(i)*f*f';
end
