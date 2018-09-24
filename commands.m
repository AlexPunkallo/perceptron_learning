%11
file='sample.txt';     % file txt containing the dataset
data=importdata(file); % importing the dataset

%12
file='sample.txt'; 
w=[1 -1];                     % weights vector of w1 and w2 
b=0.2;                        % weight value of b
[mis1] = q12(file,b,w)        % output: n° misclassified points

%13
file='sample.txt'; 
w=[1 -1];
b=0.2;
[mis2]=q13(file,b,w)           % output: new n° misclassified points

%14
file='sample.txt'; 
w=[1 -1];
b=0.2;
[mis3]=q14(file,b,w)           % output: final n° misclassified points

%24
w=[1 -1]; 
b=0.2;
file='sample.txt';
[ steps ] = q24(file,b,w)       % output: steps to achive perfect classification

%25
file='sample.txt';
w=[1 -1];                       
b=0.2;
maxiter=20;
wavg=[0 0];                     
bavg=0;                         
v=0;
its=0;
[wavg,bavg,iter]=q25(file,b,w,maxiter,wavg,bavg,v,its)

%26
file='samplemod.txt';           % txt file with the modified points
w=[1 -1];
b=0.2;
maxiter=50;
wavg=[0 0];
bavg=0;
v=0;
its=0;
[wavg,bavg,its]=q26(file,b,w,maxiter,wavg,bavg,v,its)

%37a
w_all=[0.2 1 -1];
[error] = q37a(w_all)

%37b
x0 = [0,0,0]; % Starting guess
w=[1 -1];
b=0.2;
[b,w]=q37b(x0)