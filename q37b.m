function [b,w]=q37b(x0)
options = optimoptions(@fminunc,'Algorithm','quasi-newton'); % { Minimize with fminunc function  
[opt_ws,fval,exitflag,output] = fminunc(@q37a,x0,options);   %   using quasi-newtown algorithm }
b=opt_ws(1);                     % optimal value for b
w=opt_ws(2:3);                   % optimal value for the weights vector
end