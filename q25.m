%file='sample.txt';
%w=[1 -1];
%b=0.2;
%maxiter=20;
%wavg=[0 0];
%bavg=0;
%v=0;
%its=0;
%[wavg,bavg,its]=q25(file,b,w,maxiter,wavg,bavg,v,its)

function [wavg,bavg,iter]=q25(file,b,w,maxiter,wavg,bavg,v,its) % {
data=importdata(file);  
[~,N]=size(data);
N=N-1;
so=sortrows(data,3);
[r,~]=find(so(:,N+1)==1);
r=r(1);                                             %       See q12.m
blacks1=so(1:r-1,1);
blacks2=so(1:r-1,2);
whites1=so(r:end,1);
whites2=so(r:end,2);
figure
scatter(whites1,whites2,'r','filled')
hold on
scatter(blacks1,blacks2,'b','filled')
xlabel('x_{1}')
ylabel('x_{2}')
legend('+1','-1','Location','southwest')            % }

n=0;
y=0;
iter=0;
while its < maxiter                                    % { while its < maxiter 
    for i = 1:length(data)                             %   for i = 1:length(data)
        f(i)=bavg+wavg(1)*data(i,1)+wavg(2)*data(i,2); %     New hyperplane equation 
        if  (data(i,3)*f(i))<=0                        %     if  (data(i,3)*f(i))<=0
            wavg(1)=wavg(1)+v*w(1);                    %       update all the weights
            wavg(2)=wavg(2)+v*w(2);                    %       vectors wavg, bavg, w
            bavg=bavg+v*b;                             %       and b 
            w(1)=w(1)+data(i,3)*data(i,1);             %
            w(2)=w(2)+data(i,3)*data(i,2);             %
            b=b+data(i,3);                             %
            v=1;                                       %  set value of v to 1 
        else
            v=v+1;                                     %  increase value of v
        end                                            %    
    end                                                %  }
    h=bavg+wavg(1)*data(:,1)+wavg(2)*data(:,2);        %  vector of hyperplane equations
    yhat=[];                                       % { 
    for i=1:length(data)                               
        if  h(i)>=0
            yhat(i)=1;
        else
            yhat(i)=-1;
        end 
    end                                            %        See q13.m
    yhat=yhat';
    A=[];
    A=[yhat==data(:,3)];
    k=find(A==1);
    n=length(k);                                   % }
    figure(2)
    scatter(its,n,'b','filled')                    % { Plot the perfomance having
    xlabel('n iteration')                          %   in the x axis the iteration
    ylabel('Correspondences')                      %   i and y axis the right
    title('Performance')                           %   classified points
    %axis([0 10 0 10])                             % }   
    hold on
    its=its+1;                                     % increase iteration
    %if yhat==data(:,3)                            % { if algorithm classified
    %    break                                     %   corretly all the points
    %end                                           %   stop the loop }
    if yhat==data(:,3) & y==0                      % { if algorithm classified
        iter=its;                                  %   corretly all the points
        y=1;                                       %
    end                                            %   stop the loop
end                                                %  }
hold on
figure(1)
x=[0:0.1:1.2];
plot(x,(-bavg-wavg(1)*x)/wavg(2),'k')              % plot the last division line
xlabel('x_{1}')
ylabel('x_{2}')
legend('+1','-1','Location','southwest')
title('Perceptrons line of division (averaged version)')             
hold on
figure(2)                                          % plot the last perform. point
scatter(its,n,'b','filled')                  
xlabel('n iteration')                          
ylabel('Right classified points')                      
title('Algorithm performance') 
wavg(1)=wavg(1)+v*w(1);                            % update last time the average
wavg(2)=wavg(2)+v*w(2);                            %    weights vectors
bavg=bavg+v*b;                                     %
if iter==0
    iter=its;
end
end
