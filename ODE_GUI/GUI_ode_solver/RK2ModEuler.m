function [tt,yy] = RK2ModEuler(ode,tspan,y0,Number)
% second-order Runge-Kutta Method - Modified Euler method
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
        k2 = h*f(tt(n)+h,yy(n)+k1);
        yy(n+1)=yy(n)+(k1+k2)/2; 
    end
end