
% ==================
% Filename: XOR_bp.m
% ==================
%   Two witnesses that I (id 19000915) considered, ran and examined the output of the code.  
%   Demonstrated to Yu(Roland) Thong (student id 18045346) Thursday 25-February-2021  
%   Demonstrated to Harry Tidball (student id 15015043) Wednesday 24-February-2021
%
%    I ran  the program Perceptron_XOR (a Matlab notebook) and established that it contains four distinct activities, namely
%    defining the problem,
%    creating a backpropagation algorithm,
%    defining the network architecture,
%    testing the outcomes of the backpropagation algorithm.
%    Observations on running the algorithm, it solves the XOR problem in a reasonable time.
%    Whilst trying to improve the runtime, experimenting with the following parameters net = newff(p,t,s1,{'tansig','purelin'},'traingd');
%    net.divideFcn = 'dividetrain';"
%    but on each occasion I corrupted the algorithm because I wanted to see
%    if it will have any effect on the precision.
%    Given more time I would extend the experiment by implementing a the back propagation algorithm using the
%    momentum constant to improve the time and the accuracy of the algorithm, 
%    I believe that would be useful direction to explore the XOR operation
%    because I could see the improvement in the algorithm.
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
rand('seed',8353);

echo on ;

% ==========================
% Back-propagation algorithm
% ==========================

% ============================================================================
% Reference: Negnevitsky, M., "Artificial Intelligence: A Guide to Intelligent  
%            Systems", 3rd edn. Addison Wesley, Harlow, England, 2011.
%            Sec. 6.4 Multilayer neural networks
% ============================================================================

% =============================================================
% Problem: The three-layer back-propagation network is required  
%          to perform logical operation Exclusive-OR.
% =============================================================

% Hit any key to define four 2-element input vectors denoted by "p". 
pause 

p=[1 0 1 0;1 1 0 0]

% Hit any key to define four 1-element target vectors denoted by "t". 
pause

t=[0 1 1 0];

% Hit any key to plot the input and target vectors
pause

figure
%plotpv(p,t);
%hold on;
for i=1:4
    if t(i)==-1
        plot(p(1,i),p(2,i),'bo'); hold on
    else
        plot(p(1,i),p(2,i),'b+'); hold on
    end
end
axis([-1.5 1.5 -1.5 1.5]);
hold on;
% Hit any key to define the network architecture.
pause 

s1=2; %Two neurons in the hidden layer
s2=1; %One neuron in the output layer

% Hit any key to create the network and initialise its weights and biases.
pause 

net = newff(p,t,s1,{'tansig','purelin'},'traingd');
%net.divideFcn = '';
net.divideFcn = 'dividetrain';
% Hit any key to set up the frequency of the training progress to be displayed, 
% maximum number of epochs, acceptable error, and learning rate. 
pause


net.trainParam.show=1;      % Number of epochs between showing the progress
net.trainParam.epochs=1000; % Maximum number of epochs
%net.trainParam.goal=0.0001;  % Performance goal
net.trainParam.goal = 0.01*var(t',1);
net.trainParam.lr=0.1;      % Learning rate
net.trainParam.lr=2.0;      % Learning rate
% Hit any key to train the back-propagation network. 
pause 

[net,tr]=train(net,p,t);
% Hit any key to see whether the network has learned the XOR operation.
pause 


% Hit any key to see whether the network has learned the XOR operation.
pause 

p
t
a=sim(net,p)

echo off
disp('end of XOR_bp')


