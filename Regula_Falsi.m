clear
format shortg

f(x) = ;            %INPUT FUNCTION
xl = ;              %LOWER BOUND OF INTERVAL
xr = ;              %UPPER BOUND OF INTERVAL
tolerance = 1e-7;   %ERROR TOLERANCE
N = 10000;          %MAXIMUM NUMBER OF ITERATIONS

%--------------------------------------------------------------------------
error = inf;
errorrel = inf;
i = 1;
xm = xl - (xr-xl)/(f(xr)-f(xl))*f(xl);
prog = [i xl xm xr round(f(xm),2,'significant') inf];
while abs(error)>tol && i<N
    if f(xm) < 0
        a = xm;
    else
        b = xm;
    end
    prevxm = xm;
    xm = xl - (xr-xl)/(f(xr)-f(xl))*f(xl);
    error = abs(xm-prevxm);
    errorrel = error/xm;
    i = i+1;
    prog(end+1,:) = [i xl xm xr round(f(xm),2,'significant') error];
end
fprintf('      | iter   |    xl      |     xm      |     xr      |     f(Xm)  |     E     |');
prog
format long
fprintf('Aproximacion');
xm