%Newton interpolation
%Shahin Hasan Beigi       
%Nummerical annalysis project

%%
clear 
clc
%%

q=input('insert the vector x : ');
y=input('insert the vector fi : ');
tic
n=length(q);
f=y';

%%

for i=2:n
    for j=i:n
        f(j,i)=((f(j,i-1)-f(j-1,i-1))/(q(j)-q(j-i+1)));
    end
end

%%

syms x g
g=x^0;
for k=1:n-1
    g(1,k+1)=g(1,k)*(x-q(k));
end
    %%
    a=x^0;
for m=1:n
    a(m,1)=f(m,m);
end
P=g*a;
p=simplify(P);
disp('-----------------------------------------------------')
disp('the interpolater function with newton method is :');
p
ezplot(p)
toc