% ==========================
% Filename: Perceptron_XOR.m
% ==========================
%
%   Two witnesses that I (id 19000915) considered, ran and examined the output of the code.  
%   Demonstrated to Yu(Roland) Thong (student id 18045346) Thursday 18-February-2021  
%   Demonstrated to Harry Tidball (student id 15015043) Wednesday 17-February-2021
%
%    I ran  the program Perceptron_XOR (a Matlab notebook) and established that it contains four distinct activities, namely
%    defining the problem,
%    creating a perceptron,
%    training the perceptron,
%    testing the outcomes of the trained perceptron.
%    Observations on running the algorithm, it solves the XOR problem in a reasonable time.
%    Whilst trying to improve the runtime, experimenting with the following parameters "net=newp([0 1;0 1],1)" "w=(rands(2))'
%    but on each occasion I corrupted the algorithm because I wanted to see
%    if it will have any effect on the precision.
%    Given more time I would extend the experiment by implementing a Multi-dimensional Perceptron, 
%    I believe that would be useful direction to explore the XOR operation
%    because I could see the improvement in the algorithm
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
echo on;
%
%
%
%
%
% ====================================================================
% The perceptron: an attempt to learn linearly non-separable functions
% ====================================================================

% ============================================================================
% Reference: Negnevitsky, M., "Artificial Intelligence: A Guide to Intelligent  
%            Systems", 3rd edn. Addison Wesley, Harlow, England, 2011.
%            Sec. 6.3 The perceptron
% ============================================================================

% ===========================================================================
% Problem: Two-input perceptron is required to perform logical operation XOR.
% ===========================================================================

% Hit any key to define four 3-element input vectors denoted by "p". 
pause 

%p=[0 0 1 1;0 1 0 1]
p = [0 0 1 1;0 1 0 1;0 0 0 1]

% Hit any key to define four 1-element target vectors denoted by "t". 
pause 

%t=[0 1 1 0]

t = [0 1 1 0]
% Hit any key to plot the input and target vectors.
v=[-2 3 -2 3];


plotpv(p,t,v);

% Hit any key to create the perceptron and set its initial weights to random 
% numbers in the range [0, 1]. The perceptron's threshold is set to zero.
pause

net=newp([0 1;0 1;0 1],1);
%w=(rands(2))';
w=(rands(3))';
b=[0];
net.IW{1,1}=w;
net.b{1}=b;

plotpv(p,t,v);
linehandle=plotpc(net.IW{1},net.b{1});

% Hit any key to train the perceptron for one pass and plot the classification line. 
% The training will be stoped after 10 passes.
pause
E=1;
  while (sse(E))
     [net,Y,E]=adapt(net,p,t);
     linehandle=plotpc(net.IW{1},net.b{1},linehandle);
     %
     %pause
  end;

% Hit any key to see that the perceptron has not learned the XOR operation.
pause

%p=[1;1]
%a=sim(net,p)
p = [0;1;1]
a = sim(net,p)
% Hit any key to continue.
pause

%p=[0;1]
%a=sim(net,p)
p = [0;1;0]
a = sim(net,p)
% Hit any key to continue.
pause

p = [1;0;1]
a = sim(net,p)
% Hit any key to continue.
pause

%p=[0;0]
%a=sim(net,p)
p=[0;0;0]
a=sim(net,p)
   
echo off
disp('end of Perceptron_XOR')