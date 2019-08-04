global A b ff
m=6;n=5;
A=randn(m,n);
x=randn(n,1);
b=func1(x);

f = @func2;ff=f;
h=1.e-6;
jac1=zeros(m,n);
jac2=zeros(m,n);
for k=1:n
    x1=x;   
    x1(k)=x1(k)+h;
    dx1=(f(x1)-f(x))/(h);
    x1=x;
    x1(k)=x1(k)+i*h;
    dx2=imag(f(x1))/h;
    jac1(:,k)=dx1;
    jac2(:,k)=dx2;
end

[F, J] = func3(x);
