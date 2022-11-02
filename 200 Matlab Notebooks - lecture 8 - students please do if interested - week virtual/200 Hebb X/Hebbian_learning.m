% ============================
% Filename: Hebbian_learning.m
% ============================

echo on ;

% ================
% Hebbian learning
% ================

% ============================================================================
% Reference: Negnevitsky, M., "Artificial Intelligence: A Guide to Intelligent  
%            Systems", 3rd edn. Addison Wesley, Harlow, England, 2011.
%            Sec. 6.8.1 Hebbian learning
% ============================================================================

% ==========================================================================
% Problem: A fully connected feedforward network with a single layer of five 
%          computation neurons is trained with the generalised activity
%          product rule.
% ==========================================================================

% Hit any key to define a set of input vectors denoted by "p". 
pause 

p=[0 0 0 0 0;0 1 0 0 1;0 0 0 1 0;0 0 1 0 0;0 1 0 0 1]

% Hit any key to define the network architecture.
pause 

r=5; %Five neurons in the input layer
s=5; %Five neurons in the output layer
[r,Q]=size(p);

% Hit any key to define the initial weight matrix.
pause

w=eye(s)

% Hit any key to define initial biases.
pause

b=rand(s,1)

% Hit any key to set up the maximum number of epochs, learning rate and forgetting factor. 
pause

max_epoch=1000; % Maximum number of epochs
lr=0.1;         % Learning rate
dr=0.02;        % Decay rate or forgetting factor

% Hit any key to train the network with the generalised activity product rule. 
pause

echo off

for epoch=1:max_epoch
   for q=1:Q
      % Presentation phase
      a=hardlim(netsum(w*p(:,q),(-b)));
      % Learning phase
      dw=lr*a*p(:,q)'-dr*w;
      w=w+dw;
   end
end

echo on;

% Hit any key to see whether the network has learned to associate input 5 with outputs 2 and 5.
pause 

p=[1;0;0;0;1]
a=hardlim(netsum(w*p,(-b)))

% Hit any key to see the final weights and biases of the network.
pause 

echo off

w
b

disp('end of Hebbian_learning')