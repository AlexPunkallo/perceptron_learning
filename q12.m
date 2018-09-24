%file='sample.txt'; 
%w=[1 -1];                     % weights vector of w1 and w2 
%b=0.2;                        % weight value of b
%[mis1] = q12(file,b,w)

function [mis1] = q12(file,b,w) % Input: dataset, b value, w1 and w2 weights vector
data=importdata(file);          % importing the dataset
[~,N]=size(data);               % {  if the values (+1,-1) of the 3° column
N=N-1;                          %    are mixed, sort their corresponding
so=sortrows(data,3);            %    rows (having ordered -1 and +1) } 
[r,~]=find(so(:,N+1)==1);       % {  find the value where we have the
r=r(1);                         %    the first row with value +1 in 3° col. }
blacks1=so(1:r-1,1);            % assign the x1's of -1 rows
blacks2=so(1:r-1,2);            % assign the x2's of -1 rows
whites1=so(r:end,1);            % assign the x1's of +1 rows
whites2=so(r:end,2);            % assign the x2's of +1 rows
figure                          % 
scatter(whites1,whites2,'r','filled')       % { plot the white   
hold on                                     %   and black points
scatter(blacks1,blacks2,'b','filled')       %   (+1 and -1 points)
xlabel('x_{1}')                             %              
ylabel('x_{2}')                             %
legend('+1','-1','Location','southwest')    %  }
title('Perceptrons inital line of division')%
x=[0 1];                                    % { plot the initial line
plot(x,(-b-w(1)*x)/w(2),'k')                %  }
f=b+w(1)*data(:,1)+w(2)*data(:,2);          % define linear separating hyperplane
yhat=[];                      % { for i from 1 to the length of the data,       
for i=1:length(data)          %   calculate the value in the hyperplane
    if f(i)>=0                %   equation. If f(i)>0, assign +1 in the
        yhat(i)=1;            %   vector of yhat, otherwise -1
    else                      %
        yhat(i)=-1;           %
    end                       %
end                           %  }
yhat=(yhat)';                 % transpose yhat
A=[yhat==data(:,3)];          % boolean check with 'data' of the +1 and -1 yhat values 
k=find(A~=1);                 % location where they are different
mis1=length(k);               % number of misclassified samples
