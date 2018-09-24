function [error] = q37a(w_all)                  % Input: weights vector of 
    file='sample.txt';                          %        w1,w2 AND b
    data=importdata(file);                      %
    error=0;                                    % Set error value
    for i=1:length(data)                                       % { for i=1:length(data)      
        f(i)=w_all(1)+w_all(2)*data(i,1)+w_all(3)*data(i,2);   %    update tbe Hyperbolic
        yhat(i)=(exp(f(i))-exp(-f(i)))/(exp(f(i))+exp(-f(i))); %    Function, return and
        error=error+(data(i,3)-yhat(i))^2;                     %    sum the error between
    end                                                        %    real and estim. values }
    error=1/2*error;                                           %  Final value of error
end