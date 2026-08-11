  function example
       f1=@(x,y) [y(2), -2/x*y(2)+2/x^2*y(1)+sin(log(x))/x^2];
       f2=@(x,y) [y(2), -2/x*y(2)+2/x^2*y(1)];
    
       a=1;  b=2;  alpha=1;  beta=2;  h=0.1;
    
       [x,w]=linearShooting(a,b,alpha,beta,h,f1,f2);
    
       y=1.1392070132*x-0.03920701320./x.^2-3/10*sin(log(x))-1/10*cos(log(x));
    
       disp(' ')
       disp('   x(i)    w(i)      y(i)    |y(i)-w(i)| ')
       disp(' -----------------------------------------')
       for i=1:length(x)
          fprintf('  %5.2f   %7.4f   %7.4f   %0.5g\n', ... 
                     x(i), w(i), y(i),abs(w(i)-y(i)))
       end
       disp(' ')
       
   end