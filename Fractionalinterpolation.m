%Fractional interpolation
%Shahin Hasan Beigi      
%Nummerical annalysis

%%
clear
clc
%%

w=input('insert the vector x : ');
y=input('insert the vector fi : ');
n=length(w);
f=y';

for j=1:n-1
    for i=j+1:n
            f(i,j+1)=(w(j)-w(i))/(f(j,j)-f(i,j));
    end
end
syms x

q=f(n,n);
for k=n-1:-1:1
    q=f(k,k)+((x-w(k))/q);
end
p=simplify(q);
disp('-----------------------------------------------------------------')
disp('The interpolater function is : ')
disp(p)
