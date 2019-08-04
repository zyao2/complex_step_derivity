function F=func2(x)
global A b
[m,n]=size(A);
AA=zeros(m,n);
for k=1:m
    AA(k,:)=A(k,:).*x.';
end
F=b-AA*x;