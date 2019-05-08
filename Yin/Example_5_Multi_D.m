% This file is for example 5 of D-optimal using Multiplicative algorithm
%
% minimize det((G2(w)-t*g1(w)*g1(w)^T)^{-1}), sum(w)=1, w>=0 
% where G2 is 5 by 5 matrix, g1 is 5 by 1 vector, t is from 0 to 1.
%
% There are two design spaces, square design space and circle design space. 
%
% Input
% N-number of support points
% t-ratio parameter t belongs to [0,1]
% S-design space
%
% Output
% nonzero weights with corresponding points
% running time
% tolerance error value to check the design
%
% June 25, 2015
% Written by Yue Yin

clear
runningtime=cputime; %record the starting time
N=9; % # of design points
t=0.9; %ratio parameters
S=[1 -1 0 0 1 -1 1 -1 0;0 0 1 -1 1 1 -1 -1 0]; %square design space
%S=[sqrt(2) -sqrt(2) 0 0 1 -1 1 -1 0;0 0 sqrt(2), -sqrt(2) 1 1 -1 -1 0]; %circle design space

h1=zeros(5,N); %initial value for g1
h2=zeros(5,5,N); %initial value for G2
   
%get g1 and G2 at each design points
%h1 contains the value of g1 at each support points
%h2 contains the value of G2 at each support points
for i=1:N
    h1(:,i)=[S(1,i),S(2,i),S(1,i)^2,S(2,i)^2,S(1,i)*S(2,i)]';
    h2(:,:,i)=h1(:,i)*h1(:,i)';
end

%initial value of weights
w=zeros(1,N);
for i=1:N
    w(i)=1/N;
end

%new weights for iteration
w1=zeros(1,N);
b=w1;

%set up an indicator
valid = false;
while valid == false
    G=zeros(5,5);
    g=zeros(5,1);
    for i=1:N
        G=G+w(i)*h2(:,:,i);
        g=g+w(i)*h1(:,i);
    end
    H=G-t*(g*g');
    v=inv(H);
    for i=1:N
        x=h1(:,i);
        b(i)= (1-t)*x'*v*x+t*(x-g)'*v*(x-g);
    end
    for i=1:N
        valid = b(i)<5+1e-10;
        if(valid == false)
            break;
        end
    end
    %get new iteration of weights
    if(valid==false)
        w1=w.*b/5;
        w=w1;
    end
end
result=[S' w']
resulttime = cputime-runningtime;

G=zeros(5,5);
g=zeros(5,1);
for i=1:N
    G=G+w(i)*h2(:,:,i);
    g=g+w(i)*h1(:,i);
end
for i=1:N
    a(i) = MMPhi_D(G,g,t,h1,i)-5;
end
error=max(a);
designpoints=N;
ratio=t;
method='multiplicative_D';
X = sprintf('%s, N=%d,  t=%d   time= %d,  tolerance= %d.',method,designpoints,ratio,resulttime,error);
disp(X)
