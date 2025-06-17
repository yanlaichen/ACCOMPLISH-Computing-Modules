function [tt,yy] = RK2Midpoint(ode,tspan,y0,Number)
% second-order Runge-Kutta Method - Midpoint method
    t0 = tspan(1); % Initial time
    tf = tspan(end); % Final time
    N = Number; % Number of time steps
    h = (tf-t0)/N; % Time step
    f = ode;
    
    tt = zeros(N+1,1);
    yy = zeros(N+1,1);
    tt(1)=t0;
    yy(1)=y0;
    for n=1:N % For loop, sets next t,y values
        tt(n+1)=tt(n)+h;
        k1 = h*f(tt(n),yy(n));
        k2 = h*f(tt(n)+h./2,yy(n)+k1/2);
        yy(n+1)=yy(n)+k2; 
    end
end