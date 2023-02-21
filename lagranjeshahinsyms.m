%Lagranje interpolation
%Shahin Hasan Beigi       
%Nummerical annalysis project
%%
clear 
clc
%%
tic
x1=input('insert the vector x: ');
y=input('insert thevector fi : ');
n=length(x1);
syms f x
p=0;


%%


for i=1:n
    f=1;
    g=1;
    for j=1:n
        if j~=i
            f=f*(x-x1(j));
            g=g*(x1(i)-x1(j));
        end
    end
    p=p+(f/g)*y(i);
end
p=simplify(p);
disp('the interpolater function is:');disp(p)
x=input('insert the point that you wanna to know the interpolation value in it : ');
disp(['the value in point ',num2str(x),' is'])
disp(eval(p))
ezplot(p)
   toc         
            
            
            
            
            
            
            