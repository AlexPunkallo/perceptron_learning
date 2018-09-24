%file='sample.txt'; 
%w=[1 -1];
%b=0.2;

function[mis3]=q14(file,b,w)                   %
[mis2]=q13(file,b,w);                           % Recall function before in q13.m
data=importdata(file);                          %    and add the new lines
cc=0;                                           % initialize counter
l=length(data);                                 %  
j=1;                                            % initialize repeating process j
while cc < l || j==4                            % { while cc < l or j==4
    for i = 1:length(data)                      %   for i = 1:l
        f(i)=b+w(1)*data(i,1)+w(2)*data(i,2);   %       if (data(i,3)*f)<=0 
        if (data(i,3)*f(i))<=0                  %           update the weights vector
                w(1)=w(1)+data(i,3)*data(i,1);  %           of w1 and w2 and the weigth
                w(2)=w(2)+data(i,3)*data(i,2);  %           value of b
                b=b+data(i,3);                  %       
        else                                    %        otherwise
            cc=cc+1;                            %           increase counter
        end                                     %
    end                                         %
    if cc<l                                     %       if cc<l
        cc=0;                                   %           set cc to 0
    end                                         %
    yhat=[];                                    %   
    for i=1:8                                   % { 
       if f(i)>=0
            yhat(i)=1;
        else
            yhat(i)=-1;
        end 
    end                                         %       See q13.m
    yhat=yhat';
    A=[];
    A=[yhat==data(:,3)];
    k=find(A~=1);
    mis3=length(k); 
    j=j+1;                                      % }
    hold on
    x=[0 1];                                    %       plot the new division line
    title('Perfect classification with 6 lines')
    plot(x,(-b-w(1)*x)/w(2),'k')                %       until there will be 6 lines }
end
end