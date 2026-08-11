function [x,w]=linearShooting(a,b,alpha,beta,h,f1,f2)
 
 [x,u]=RK4(a,b, [alpha,0],h,f1); 
 [~,v]=RK4(a,b,[0,1],h,f2);
 w=u(:,1)+(beta-u(end,1))/v(end,1)*v(:,1);
  
end