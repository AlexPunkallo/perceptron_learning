%file='sample.txt'; 
%w=[1 -1];
%b=0.2;

function[mis2]=q13(file,b,w)
data=importdata(file);                %  {

[~,N]=size(data);
N=N-1;
so=sortrows(data,3);
[r,~]=find(so(:,N+1)==1);
r=r(1);
blacks1=so(1:r-1,1);                   %            See q12.m
blacks2=so(1:r-1,2);
whites1=so(r:end,1);
whites2=so(r:end,2);
figure
scatter(whites1,whites2,'r','filled')
hold on
scatter(blacks1,blacks2,'b','filled')
xlabel('x_{1}')
ylabel('x_{2}')
legend('+1','-1','Location','southwest') 
title('New line of division')
x=[0 1];
plot(x,(-b-w(1)*x)/w(2),'k')                        
f=b+w(1)*data(:,1)+w(2)*data(:,2);      %  }

for i = 1:length(data)                  % { for 1:length(data),  
    if (data(i,3)*f(i))<=0              %   if (data(i,3)*f(i))<=0,
        w(1)=w(1)+data(i,3)*data(i,1);  %   update the weights vector
        w(2)=w(2)+data(i,3)*data(i,2);  %   of w1 and w2 and the weigth
        b=b+data(i,3);                  %   value of b
    end                                 %
end                                     %  }
yhat=[];                                % {     
for i=1:length(data)                    %            
if f(i)>=0                              %           
   yhat(i)=1;                           %          
else                                    %               
   yhat(i)=-1;                          %
end                                     %
end                                     %   Plot the new line and       
yhat=yhat';                             %   and returns the new number of
A=[];                                   %   of misclassified samples
A=[yhat==data(:,3)];                    %
k=find(A~=1);                           %  
hold on                                 %     
plot(x,(-b-w(1)*x)/w(2),'k')            %    
mis2=length(k);                          % }
end
