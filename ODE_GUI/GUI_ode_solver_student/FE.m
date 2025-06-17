function [t,y] = FE(ode,tspan,y0,Number)
% Forward Euler method
    t0 = tspan(1); % Initial time
    tf = tspan(end); % Final time
    N = Number; % Number of time steps
    t = zeros(N+1,1);
    y = zeros(N+1,1);
    h = (tf-t0)/N; % Time step
    t(1)=t0;
    y(1)=y0;
    for n=1:N % For loop, sets next t,y values
        t(n+1)=t(n)+h;
% Fill in below to assign value for yy(n+1)




        
    end
end