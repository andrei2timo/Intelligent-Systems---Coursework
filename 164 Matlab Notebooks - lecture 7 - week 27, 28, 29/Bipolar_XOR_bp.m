% ==========================
% Filename: Bipolar_XOR_bp.m
% ==========================

rand('seed',8353) ;

echo on;

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
%          to perform logical operation Bipolar Exclusive-OR.
% =============================================================

% Hit any key to define four 2-element input vectors denoted by "p". 
pause 

p=[1 -1 1 -1;1 1 -1 -1]

% Hit any key to define four 1-element target vectors denoted by "t". 
pause

t=[-1 1 1 -1]

% Hit any key to plot the input and target vectors
pause

figure
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
net.divideFcn = '';

% Hit any key to set up the frequency of the training progress to be displayed, 
% maximum number of epochs, acceptable error, and learning rate. 
pause

net.trainParam.show=1;      % Number of epochs between showing the progress
net.trainParam.epochs=1000; % Maximum number of epochs
net.trainParam.goal=0.001;  % Performance goal
net.trainParam.lr=0.2;      % Learning rate

% Hit any key to train the back-propagation network. 
pause 

[net,tr]=train(net,p,t);

% Hit any key to see whether the network has learned the XOR operation.
pause 

p
t
a=sim(net,p)

echo off
disp('end of Bipolar_XOR_bp')