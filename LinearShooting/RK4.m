function [t,w]=RK4(a,b,alpha,h,f)
      N=ceil((b-a)/h);
      t(1)=a;
      w(1,:)=alpha;
      for i=1:N
         K1=h*f(t(i),w(i,:));
         K2=h*f(t(i)+h/2,w(i,:)+K1/2);
         K3=h*f(t(i)+h/2,w(i,:)+K2/2);
         K4=h*f(t(i)+h,w(i,:)+K3);
         w(i+1,:)=w(i,:)+(K1+2*K2+2*K3+K4)/6;
         t(i+1)=t(i)+h;
      end
end