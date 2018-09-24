%file='samplemod.txt';
%w=[1 -1];
%b=0.2;
%maxiter=50;
%wavg=[0 0];
%bavg=0;
%v=0;
%its=0;
%[wavg,bavg,its]=q26(file,b,w,maxiter,wavg,bavg,v,its)

function [wavg,bavg,iter]=q26(file,b,w,maxiter,wavg,bavg,v,its)
[wavg,bavg,iter]=q25(file,b,w,maxiter,wavg,bavg,v,its)
end

%%%%%% NO %%%%%%
%{
function [wavg,bavg,its]=q26(file,b,w,maxiter,wavg,bavg,v,its) % {
data=importdata(file);
[~,N]=size(data);
N=N-1;
so=sortrows(data,3);
[r,~]=find(so(:,N+1)==1);
r=r(1);                                                 %     See q12.m
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
legend('+1','-1','Location','southwest')                %  }

n=0;                                                    % {                                           
while its < maxiter                                     % {
    for i = 1:length(data)
        f(i)=bavg+wavg(1)*data(i,1)+wavg(2)*data(i,2);
        if  (data(i,3)*f(i))<=0
            wavg(1)=wavg(1)+v*w(1); 
            wavg(2)=wavg(2)+v*w(2); 
            bavg=bavg+v*b;                              %    See q25.m
            w(1)=w(1)+data(i,3)*data(i,1); 
            w(2)=w(2)+data(i,3)*data(i,2);
            b=b+data(i,3);
            v=1;
        else
            v=v+1;
        end
    end
    h=bavg+wavg(1)*data(:,1)+wavg(2)*data(:,2);         % }
    yhat=[];                                            % {
    for i=1:8
        if  h(i)>=0
            yhat(i)=1;
        else
            yhat(i)=-1;
        end 
    end
    yhat=yhat';
    A=[];
    A=[yhat==data(:,3)];
    k=find(A==1);
    n=length(k);
    figure(2)
    scatter(its,n,'b','filled')
    xlabel('n iteration')
    ylabel('Correspondences')
    title('Performance')
    hold on
    its=its+1;
    if yhat==data(:,3)
        break
    end
end
hold on
figure(1)
x=[0:0.1:1.2];
plot(x,(-bavg-wavg(1)*x)/wavg(2),'k')

hold on
figure(2)
scatter(its,n,'b','filled')
wavg(1)=wavg(1)+v*w(1); 
wavg(2)=wavg(2)+v*w(2); 
bavg=bavg+v*b;
end
%}