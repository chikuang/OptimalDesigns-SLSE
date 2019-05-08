# Compute A-optimal Design at optimal solution
# For polynomial Regression

# Nov 14 / 2017
# Author: Chi-Kuang Yeh
#########################################################

# sum(diag(A)) is equivalent to trace(A)
# direct sum = direct.sum( x, y )
# matrix.trace
# 
library("matrixcalc")
###
# Order of the polynomial model
q = 2;  t1 = 0.6;
# The optimal Solution
if(t1 <= 2-sqrt(2)){
  data_1 = c(-1,1, 0.5,0.5);
  xi = matrix( data_1,nrow = 2, ncol = 2, byrow =T);
}else{
  data_1 = c(-1,0,1, (2-sqrt(2))/(2*t1),(t1-2+sqrt(2))/t1,(2-sqrt(2))/(2*t1));
  xi = matrix( data_1, nrow = 2, ncol = length(data_1)/2, byrow = T);
}
## Calculating g1,G2 at optimal xi
g1=matrix(0,nrow=2,ncol=1); G2=matrix(0,nrow=2,ncol=2);
for( i in 1:ncol(xi)){
  g1[1,1] = g1[1,1] + xi[2,i]*xi[1,i];      # wi*xi
  g1[2,1] = g1[2,1] + xi[2,i]*(xi[1,i])^2;  # wi*xi^2
  G2[1,1] = G2[1,1] + xi[2,i]*(xi[1,i])^2;  #wi*xi^2
  G2[1,2] = G2[1,2] + xi[2,i]*(xi[1,i])^3;  #wi*xi^3
  G2[2,1] = G2[2,1] + xi[2,i]*(xi[1,i])^3;  #wi*xi^3
  G2[2,2] = G2[2,2] + xi[2,i]*(xi[1,i])^4;  #wi*xi^4
}
B = rbind(cbind(1,sqrt(t1)*t(g1)),cbind(sqrt(t1)*g1,G2)) # Constructing the matrix B

# Calculate the partial derivative of the polynomial model
# With order q
# The answer is in as a column vector
ff = function(x){
  partial = matrix(0,nrow=q,ncol=1);
  for(i in 1:q){ partial[i,1] = x^i; }
  return(partial);
}

# Finally, Calculating the directioal derivative
dA = function(x,t2=t1){
  f = ff(x);
  row = length(f);
  M = rbind(cbind(1,sqrt(t2)*t(f)),cbind(sqrt(t2)*f,f%*%t(f)));
  C = direct.sum( 0, diag(q))
  return (matrix.trace(M%*%solve(B)%*%C%*%solve(B))-matrix.trace(C%*%solve(B)) );
}
x=seq(from=-1.25,to=1.25,by=0.001)
plot(x, sapply(x, dA),col="black",xlim=c(-1.10,1.10),ylim=c(-3,1),ylab="d_A",type="l")
title("(a)")
abline(h=0,col="red",lty="dashed")

