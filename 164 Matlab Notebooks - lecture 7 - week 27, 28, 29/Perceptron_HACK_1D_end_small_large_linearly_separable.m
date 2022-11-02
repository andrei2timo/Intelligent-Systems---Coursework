
% ==========================
% Filename: Perceptron_AND.m
% ==========================

echo on;

% =====================================================
% The perceptron: learning linearly separable functions
% =====================================================

% ============================================================================
% Reference: Negnevitsky, M., "Artificial Intelligence: A Guide to Intelligent  
%            Systems", 3rd edn. Addison Wesley, Harlow, England, 2011.
%            Sec. 6.3 The perceptron
% ============================================================================

% ===========================================================================
% Problem: Two-input perceptron is required to perform logical operation AND.
% ===========================================================================

% Hit any key to define four 2-element input vectors denoted by "p". 

pause
%p=[0 0 1 1;0 1 0 1]
p=[0 0 1 1 12 56 99 25 35]

% Hit any key to define four 1-element target vectors denoted by "t". 
pause

%t=[0 0 0 1]
t=[0 0 0 0 0 1 1 0 1]

% Hit any key to plot the input and target vectors.
pause

%v=[-20 300 -20 300];

v=[-20 300 -20 300]
plotpv(p,t,v);

% Hit any key to create the perceptron and set its initial weights to random 
% numbers in the range [0, 1]. The perceptron's threshold is set to zero.
pause

%net=newp([0 1;0 1],1);
%net=newp([0 1],1);
net=newp([0 1],1,0);
%w=(rands(2))';
w=(rands(1))';
b=[0];
net.IW{1,1}=w;
net.b{1}=b;

plotpv(p,t,v);
linehandle=plotpc(net.IW{1},net.b{1});

% Hit any key to train the perceptron for one pass and plot the classification line. 
% The receptron will be trained until the error is zero.
pause

E=1;
  while (sse(E))
     [net,Y,E]=adapt(net,p,t);
     linehandle=plotpc(net.IW{1},net.b{1},linehandle);
     %
     %pause
  end;
   
% Hit any key to see whether the perceptron has learned the AND operation.
pause

%p=[1;1]  original 
p=[0];
a=sim(net,p);
p=[0]
a=sim(net,p)
p=[1]
a=sim(net,p)
p=[1]
a=sim(net,p)

% Hit any key to see whether the perceptron recognises items it has not been trained on?
pause
p=[-2000]
a=sim(net,p)
pause
p=[3000]
a=sim(net,p)

pause
% Where is the decision point?

% Hit any key to continue.
pause
p=[25]
a=sim(net,p)
pause
p=[26]
a=sim(net,p)
pause
p=[27]
a=sim(net,p)
pause
p=[28]
a=sim(net,p)
pause
p=[29]
a=sim(net,p)
pause
p=[30]
a=sim(net,p)
pause
p=[31]
a=sim(net,p)
pause
p=[32]
a=sim(net,p)
pause
p=[33]
a=sim(net,p)
pause
p=[34]
a=sim(net,p)
pause
p=[35]
a=sim(net,p)
pause

% Hit any key to continue.
pause
echo off
disp('end of Perceptron_AND')