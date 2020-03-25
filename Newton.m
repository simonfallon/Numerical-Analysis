clear
syms x
format longg

f(x) = ;                    %INPUT FUNCTION
x0 = ;                      %INPUT START-POINT
tol = 1e-7;                 %INPUT ERROR TOLERANCE
N = 100;                    %INPUT MAXIMUM NUMBER OF ITERATIONS

%--------------------------------------------------------------------------

fx(x) = diff(f,x);
f = matlabFunction(f);
fx = matlabFunction(fx);
i = 0;
error = inf;
xn = x0;
errorrel = inf;
prog = [i xn round(f(xn),2,'significant') inf];
while abs(error) > tol && i<N
    next = double(xn-f(xn)/fx(xn));
    error = abs(xn-next);
    xn = next;
    errorrel = error/xn;
    i = i+1;
    prog(end+1,:) = [i xn round(f(xn),2,'significant') round(error,2,'significant')];
end
fprintf('                      | iteration|           xi         |         f(xi)            |        E           |');
prog
format long
fprintf('Aproximation');
xn