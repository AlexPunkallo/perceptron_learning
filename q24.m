%w=[1 -1]; 
%b=0.2;
%file='sample.txt';
function [ steps ] = q24(file,b,w)          % Input: data, weights vector of
data=importdata(file);                      %    w1 and w2, and weight value of b
[~,N]=size(data);                           % Output: steps to let program
N=N-1;                                      %    achive perfect classification
so=sortrows(data,3);                        
[r,~]=find(so(:,N+1)==1);
r=r(1);
blacks1=so(1:r-1,1);
blacks2=so(1:r-1,2);
whites1=so(r:end,1);
whites2=so(r:end,2);                        %        See q12.m
figure
scatter(whites1,whites2,'r','filled')
hold on
scatter(blacks1,blacks2,'b','filled')
xlabel('x_{1}')
ylabel('x_{2}')
legend('+1','-1','Location','southwest')
x=[0 1];
plot(x,(-b-w(1)*x)/w(2),'k')
f=b+w(1)*data(:,1)+w(2)*data(:,2);          %

cc=0;                                       % {
l=length(data);
steps=1;
while cc < l
    for i = 1:l
        f(i)=b+w(1)*data(i,1)+w(2)*data(i,2);
        if (data(i,3)*f(i))<=0
                w(1)=w(1)+data(i,3)*data(i,1);
                w(2)=w(2)+data(i,3)*data(i,2); %        See q14.m
                b=b+data(i,3);
        else
            cc=cc+1;
        end
    end
    if cc<l
        cc=0;
    end                                         % }
    yhat=[];                                    % {
    for i=1:length(data)   
       if f(i)>=0
            yhat(i)=1;
       else
            yhat(i)=-1;
       end 
    end
    yhat=yhat';                                 %     See q13.m
    A=[yhat==data(:,3)];
    k=find(A~=1);
    n=length(k); 
    %hold on
    %x=[0 1];
    %plot(x,(-b-w(1)*x)/w(2),'k')
    %axis([0 1.2 0 1.2])                        %  }
    if yhat==data(:,3)                          % { When the algorithm achives
        x=[0 1];                                %   the right classification  
        plot(x,(-b-w(1)*x)/w(2),'k')            %   plot the last division line
        axis([0 1.2 0 1.2])                     %
        break                                   %
    end                                         %  }
    steps=steps+1;                              %  Increase steps number
end
end