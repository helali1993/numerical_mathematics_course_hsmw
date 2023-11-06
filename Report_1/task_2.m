%% Task 2
%Locate roots of the root(s) of the function 
%and label them in the figure.

%We Define the Function
f = @(x) log(x) + cos(x) - 1;

% following is the plotting from task 1 for visualisation
% adding title
title('log(x) + cos(x) - 1') 
% adding labels
xlabel('x') 
ylabel('f(x)')

hold on 

grid on
grid minor

x = [0:0.0001:11];
plot(x,f(x))



%We find the root using fzero and store it
%there exists one root in (0, inf).
root = fzero(f,3);

% plot root point
plot(root,f(root),'*') 

% label root point
label = {'Root at ',root};
% coordinates to display text
%Precision here is chosen to be 10^(-4)
text(4.65,0.0001,label) 

