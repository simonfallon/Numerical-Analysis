clear
syms x
f(x) = ;                %INPUT FUNCTION
dx = ;                  %INPUT THE STEP´S SIZE
d = ;                   %INPUT DIRECTION (1=POSITIVE, -1=NEGATIVE)
x0 = ;                  %INPUT THE INITIAL POINT
N = 100;                %INPUT THE MAXIMAL NUMBER OF ITERATIONS

%--------------------------------------------------------------------------

dx = dx*d;
f = matlabFunction(f);
xn1 = x0;
xn2 = x0+dx;
n = 0;
num = 0;
intervals = [];
while n<N
    if f(xn1)*f(xn2)>0
        xn1 = xn2;
        xn2 = xn1+dx;
        n = n+1;
    end
    if(n<N)
        if dx<0
            intervals(end+1,:)= [xn2 xn1];
        else
            intervals(end+1,:)= [xn1 xn2];
        end
        xn1 = xn2;
        xn2 = xn1+dx;
    end
    n = n+1;
end
intervals