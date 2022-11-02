% ==========================
% Filename: Perceptron_XOR.m
% ==========================

echo on ;
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
%    I ran  the program Perceptron_XOR (a Matlab notebook) and established %TA
%    that it contains four distinct activities, namely %TA
%       a) defining the problem, %TA
%       b) creating a perceptron, %TA
%       c) training the perceptron, %TA
%       d) testing the outcomes of the trained perceptron. %TA
%    Observations on running the algorithm, it solves the XOR problem in a  reasonable time. %TA
%    Whilst trying to improve the runtime, experimenting with the following   parameters "net=newp([0 1;0 1],1)" "w=(rands(2))' %TA
%    but on each occasion I corrupted the algorithm because the results %TA
%    will differ. %TA
%    Further observations are Similar to biological neurons which are activated when a certain threshold is %TA
%    reached, we will once again use a sigmoid transfer function to provide a nonlinear activation of %TA
%    our neural network (for improving the algorithm) by which I mean he sigmoid function 1/(1+e^(-x)) will squash all values between the range %TA
%    of 0 and 1. Also a requirement of the function in multilayer perceptrons, which use backpropagation to learn, is that this sigmoid activation function is continuously differentiable. %TA    Given more time I would extend the experiment by adding a little more
%    complexity by including a third layer, or a hidden layer into the network. %TA
%    I believe that would be useful direction to explore because for doing so is based on the concept of linear separability. %TA
%    While logic gates like “OR”, “AND” or “NAND” can have 0’s and 1’s separated by a single line (or hyperplane in multiple dimensions), %TA
%    this linear separation is not possible for “XOR” (exclusive OR). %TA
%
% Hit any key to define four 2-element input vectors denoted by "p". 
pause 

p=[0 0 1 1;0 1 0 1]

% Hit any key to define four 1-element target vectors denoted by "t". 
pause 

t=[0 1 1 0]

% Hit any key to plot the input and target vectors.
v=[-2 3 -2 3];

plotpv(p,t,v);

% Hit any key to create the perceptron and set its initial weights to random 
% numbers in the range [0, 1]. The perceptron's threshold is set to zero.
pause

net=newp([0 1;0 1],1);
w=(rands(2))';
b=[0];
net.IW{1,1}=w;
net.b{1}=b;

plotpv(p,t,v);
linehandle=plotpc(net.IW{1},net.b{1});

% Hit any key to train the perceptron for one pass and plot the classification line. 
% The training will be stoped after 10 passes.
pause

for a=1:10;
   [net,Y,E]=adapt(net,p,t);
   linehandle=plotpc(net.IW{1},net.b{1},linehandle);
   pause
end;

% Hit any key to see that the perceptron has not learned the XOR operation.
pause

p=[1;1]
a=sim(net,p)

% Hit any key to continue.
pause

p=[0;1]
a=sim(net,p)

% Hit any key to continue.
pause

p=[1;0]
a=sim(net,p)

% Hit any key to continue.
pause

p=[0;0]
a=sim(net,p)
   
echo off
disp('end of Perceptron_XOR')