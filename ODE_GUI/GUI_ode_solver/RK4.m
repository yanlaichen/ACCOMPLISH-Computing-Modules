function [tt,yy] = RK4(ode,tspan,y0,Number)
% Runge-Kutta Method of order 4
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
        k2 = h*f(tt(n)+h./2,yy(n)+k1./2);
        k3 = h*f(tt(n)+h./2,yy(n)+k2./2);
        k4 = h*f(tt(n)+h,yy(n)+k3);
        yy(n+1)=yy(n)+(k1+k2.*2+k3.*2+k4)./6; 
    end
end