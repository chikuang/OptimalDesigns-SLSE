# Compute D-optimal Design at optimal solution
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
q = 2;  t1=0.5; t2=0.7;t3 = 0.5; t4=0.7;
# The optimal Solution

## Calculating g1,G2 at optimal
Bmat=function(tb,xi){
  g1=matrix(0,nrow=2,ncol=1); G2=matrix(0,nrow=2,ncol=2);
  for( i in 1:ncol(xi)){
    g1[1,1] = g1[1,1] + xi[2,i]*xi[1,i];      # wi*xi
    g1[2,1] = g1[2,1] + xi[2,i]*(xi[1,i])^2;  # wi*xi^2
    
    G2[1,1] = G2[1,1] + xi[2,i]*(xi[1,i])^2;  #wi*xi^2
    G2[1,2] = G2[1,2] + xi[2,i]*(xi[1,i])^3;  #wi*xi^3
    G2[2,1] = G2[2,1] + xi[2,i]*(xi[1,i])^3;  #wi*xi^3
    G2[2,2] = G2[2,2] + xi[2,i]*(xi[1,i])^4;  #wi*xi^4
  }
  B = rbind(cbind(1,sqrt(tb)*t(g1)),cbind(sqrt(tb)*g1,G2)) # Constructing the matrix B
}
# Calculate the partial derivative of the polynomial model
# With order q
# The answer is in as a column vector
ff = function(x){
  partial = matrix(0,nrow=q,ncol=1);
  for(i in 1:q){ partial[i,1] = x^i; }
  return(partial);
}
# Finally, Calculating the directioal derivative
dA1 = function(x,tt=t1){
  f = ff(x);
  if(tt <= 2-sqrt(2)){
    data_1 = c(-1,1, 0.5,0.5);
    xi = matrix( data_1,nrow = 2, ncol = 2, byrow =T);
  }else{
    data_1 = c(-1,0,1, (2-sqrt(2))/(2*tt),(tt-2+sqrt(2))/tt,(2-sqrt(2))/(2*tt));
    xi = matrix( data_1, nrow = 2, ncol = length(data_1)/2, byrow = T);
  }
  B = Bmat(tt,xi);  C = direct.sum( 0, diag(q)) ;
  M = rbind(cbind(1,sqrt(tt)*t(f)),cbind(sqrt(tt)*f,f%*%t(f)));
 
  return (matrix.trace(M%*%solve(B)%*%C%*%solve(B))-matrix.trace(C%*%solve(B)) );
}
dA2 = function(x,tt=t2){
  f = ff(x);
  if(tt <= 2-sqrt(2)){
    data_1 = c(-1,1, 0.5,0.5);
    xi = matrix( data_1,nrow = 2, ncol = 2, byrow =T);
  }else{
    data_1 = c(-1,0,1, (2-sqrt(2))/(2*tt),(tt-2+sqrt(2))/tt,(2-sqrt(2))/(2*tt));
    xi = matrix( data_1, nrow = 2, ncol = length(data_1)/2, byrow = T);
  }
  B = Bmat(tt,xi);  C = direct.sum( 0, diag(q)) ;
  M = rbind(cbind(1,sqrt(tt)*t(f)),cbind(sqrt(tt)*f,f%*%t(f)));
  return (matrix.trace(M%*%solve(B)%*%C%*%solve(B))-matrix.trace(C%*%solve(B)) );
}

dD1 = function(x,tt=t3){
  f = ff(x);
  if(tt <= 2/3){
    data_1 = c(-1,1, 0.5,0.5);
    xi = matrix( data_1,nrow = 2, ncol = length(data_1)/2, byrow = T);
  }else{
    data_1 = c(-1,0,1, 1/(3*tt),(3*tt-2)/(3*tt),1/(3*tt));
    xi = matrix( data_1, nrow = 2, ncol = length(data_1)/2, byrow = T);
  }
  B = Bmat(tt,xi);
  M = rbind(cbind(1,sqrt(tt)*t(f)),cbind(sqrt(tt)*f,f%*%t(f)));
  return (matrix.trace(M%*%solve(B))-(q+1) );
}
dD2=function(x,tt=t4){
  f = ff(x);
  if(tt <= 2/3){
    data_1 = c(-1,1, 0.5,0.5);
    xi = matrix( data_1,nrow = 2, ncol = length(data_1)/2, byrow = T);
  }else{
    data_1 = c(-1,0,1, 1/(3*tt),(3*tt-2)/(3*tt),1/(3*tt));
    xi = matrix( data_1, nrow = 2, ncol = length(data_1)/2, byrow = T);
  }
  B = Bmat(tt,xi);
  M = rbind(cbind(1,sqrt(tt)*t(f)),cbind(sqrt(tt)*f,f%*%t(f)));
  return (matrix.trace(M%*%solve(B))-(q+1) );
}

## Start Graph


x=seq(from= - 1,to= 1,by=0.001)
par(mfrow=c(2,2))
# dA, t=0.1
plot(x, sapply(x, dA1),col="black",xlim=c(-1.10,1.10),ylim=c(-2.5,0.5),ylab=expression('d'["A"]),type="l")
title("(a)")
abline(h=0,col="red",lty="dashed")
# dA, t=0.6
plot(x, sapply(x, dA2),col="black",xlim=c(-1.10,1.10),ylim=c(-2.5,0.5),ylab=expression('d'["A"]),type="l")
title("(b)")
abline(h=0,col="red",lty="dashed")
# dD, t = 0.2
plot(x, sapply(x, dD1),col="black",xlim=c(-1.10,1.10),ylim=c(-2.5,0.5),ylab=expression('d'["D"]),type="l")
title("(c)")
abline(h=0,col="red",lty="dashed")
# dD, t = 0.6
plot(x, sapply(x, dD2),col="black",xlim=c(-1.10,1.10),ylim=c(-2.5,0.5),ylab=expression('d'["D"]),type="l")
title("(d)")
abline(h=0,col="red",lty="dashed")
