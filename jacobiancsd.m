function [A,z]=jacobiancsd(fun,x)
% JACOBIANCSD    Complex Step Jacobian
% J = jacobiancsd(f,x) returns the numberical (m x n) Jacobian matrix of a 
% m-vector function, f(x) at the refdrence point, x (n-vector).
% [J,z] = jacobiancsd(f,x) also returns the function value, z=f(x).
%
% Example
% f=@(x)[x(1)*x(2)^2;x(1)*x(3)^2;x(1)^2];
% x=1:3;
% [J,z]=jacobiancsd(f,x)
% J =
%     4     4     0
%     9     0     6
%     2     0     0
% z =
%     4
%     9
%     1
%
% By Yi Cao at Cranfield University, 02/01/2008
%
z=fun(x);                       % function value
n=numel(x);                     % size of independent
m=numel(z);                     % size of dependent
A=zeros(m,n);                   % allocate memory for the Jacobian matrix
h=n*eps;                        % differentiation step size
h=1.e-3;

for k=1:n                       % loop for each independent variable 
    x1=x;                       % reference point
    x1(k)=x1(k)+i*h;            % increment in kth independent variable
    A(:,k)=imag(fun(x1))/h;     % complex step differentiation 
end
return;

for k=1:n                       % loop for each independent variable 
    x1=x;                       % reference point
    x2=x;
    x1(k)=x1(k)+h;            % increment in kth independent variable
    x2(k)=x2(k)-h;
    A(:,k)=(fun(x1)-z)/h;
    %A(:,k)=0.5*(fun(x1)-fun(x2))/h;
   % A(:,k)=imag(fun(x1))/h;     % complex step differentiation 
   
end
return
A1=zeros(m,n); 
h=1.e-3;

for k=1:n                       % loop for each independent variable 
    x1=x;                       % reference point
    x1(k)=x1(k)+i*h;            % increment in kth independent variable
    A1(:,k)=imag(fun(x1))/h;     % complex step differentiation 
end
