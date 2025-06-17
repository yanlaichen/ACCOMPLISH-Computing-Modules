function [tt,yy] = Taylor(ode,tspan,y0,Number,Order)
% Taylor Method of order "Order"
    t0 = tspan(1); % Initial time
    tf = tspan(end); % Final time
    N = Number; % Number of time steps
    h = (tf-t0)/N; % Time step

    syms y t
    f = sym(ode);
    dfun(1)=f;
    TO = dfun(1)
    for i=1:Order-1
        dtfun = simplify(diff(dfun(i),t) + diff(dfun(i),y)*f);
        dfun(i+1) = dtfun;
        TO = TO+h.^(i+1)./factorial(i+1).*dfun(i+1);
    end
    TO = matlabFunction(TO)
    tt = zeros(N+1,1);
    yy = zeros(N+1,1);
    tt(1)=t0;
    yy(1)=y0;
    for n=1:N % For loop, sets next t,y values
        tt(n+1)=tt(n)+h;
        yy(n+1)=yy(n)+h*TO(tt(n),yy(n)); 
    end
end