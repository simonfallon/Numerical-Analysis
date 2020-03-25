clear
syms x
format short

f(x) = ;            %INPUT FUNCTION
xl = ;              %LOWER BOUND OF INTERVAL
xr = ;              %UPPER BOUND OF INTERVAL
tolerance = 1e-7;   %ERROR TOLERANCE
N = 10000;          %MAXIMUM NUMBER OF ITERATIONS

%-------------------------

f = matlabFunction(f);
n = 1;
error = inf;
errorRel = inf;
xm = (xl+xr)/2;
prog = [n xa xc xb round(f(xc),2,'significant') inf];
while abs(error) > tolerance && n<N
    if f(xm)*f(xl)<0
        xr = xm;
    else
        xl = xm;
    end
    xm = (xl+xr)/2;
    error = xr - xm;
    errorRel = error/xm;
    n = n + 1;
    prog(end+1,:) = [n xl xm xr round(f(xm),2,'significant') round(error,2,'significant')];
    xm; 
end
fprintf('      | iter   |    j      |     xm      |     r      |     f(Xm)  |     E     |');
prog
fprintf('Aproximacion');
format long
xc