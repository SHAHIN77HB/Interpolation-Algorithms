%Hermit interpolation 
%Shahin Hasan Beigi      
%Nummerical annalysis
%in this code when you asked to "insert the information (f , df , d2f
%,...)" if you have no onformation about df , d2f ,... just insert the
%value of f_i in point x_i . If you have information insert it as a vector
%like [ f_i df_i d2f_i ...]
%%
clear
clc
%%
x=input('insert the vector x :');
m=length(x);
g=[];
q=[];
for i=1:m
    fprintf('insert the information (f , df , d2f ,...) for x%d : ',i)
    y=input('');
    n(i)=length(y);
    for j=1: n(i)
        f(i,j)=y(j);
    end
    
    q=[q ones(1,n(i))*x(i)];
    g=[g ; ones(n(i),1)*y(1)];
end
%%
z=length(q);
for k=2:z
    for t=k:z
        if q(t)==q(t-k+1)
            w=find(x==q(t));
            g(t,k)=f(w,k)/factorial(k-1);
        else
            g(t,k)=(g(t,k-1)-g(t-1,k-1))/(q(t)-q(t-k+1));
        end
    end
end
%%
syms x
p=0*x;
s=1+0*x;
for a=1:z
    p=p+g(a,a)*s;
    s=s*(x-q(a));
end
P=simplify(p);
disp('-----------------------------------------------------------------------------------------------------------------');
disp('');
disp('the interpolater function based on Hermit method is:')
disp(P)
ezplot(P)

