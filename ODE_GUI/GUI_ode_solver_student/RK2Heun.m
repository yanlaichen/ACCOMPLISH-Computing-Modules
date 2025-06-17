function [tt,yy] = RK2Heun(ode,tspan,y0,Number)
% second-order Runge-Kutta Method - Heun's method
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
% Fill in below to assign value for yy(n+1)
        


        
    end
end