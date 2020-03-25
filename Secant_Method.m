clear
format longg
f = @(x) log(sin(x)^2 + 1) - 1/2;

x0 = ;              %LOWER BOUND OF INTERVAL
xr = ;              %UPPER BOUND OF INTERVAL
tolerance = 1e-7;   %ERROR TOLERANCE
N = 10000;          %MAXIMUM NUMBER OF ITERATIONS

%--------------------------------------------------------------------------


i = 0;
error = inf;
errorrel = inf;
prog = [i xnm1 round(f(xnm1),2,'significant') 0];
i = i+1;
prog(end+1,:) = [i xn round(f(xn),2,'significant') 0];
while abs(error) > tol  && i<N
    xn = x0-(f(x0)*(x0-x1)/(f(x0)-f(x1)));
    x1 = x0;
    x0 = xn;
    error = abs(x0-x1);
    errorrel = error/x;
    i = i+1;
    prog(end+1,:) = [i xn round(f(x0),2,'significant') round(error,2,'significant')];
end
fprintf('                 | iter     |          xi           |            f(xi)         |                  E      |')
prog
format long
fprintf('Aproximation');
xn