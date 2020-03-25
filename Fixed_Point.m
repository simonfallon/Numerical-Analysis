clear
syms x
format shortg

f(x) = exp(x) +7*x^2-21*x;
g(x) = log(-7*x^2+21*x);
x0 = 2;
tol = 1e-7;
N = 30;
%Primer error se ignora 
%Se escofe entre errores en while y en prog se cambia !!!2 prog!!!

%----------------
f = matlabFunction(f);
g = matlabFunction(g);

xi = x0;
i = 0;
error = inf;
errorrel = inf;
prog = [i xi g(xi) round(f(xi),2,'significant') 0];
while error > tol && i<N
    i = i + 1;
    error = abs(g(xi)-xi);
    xi = g(xi);
    errorrel = error/xi;
    prog(end+1,:) = [i xi g(xi) round(f(xi),2,'significant') round(error,2,'significant')];
end
fprintf('        | iter |     xi      |    g(xi)    |   f(xi)  |    E     |');

prog
format long
fprintf('Aproximacion');
xi
