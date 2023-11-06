%% Task 1
%we start by defining the interval for variable x.
%Then we define the real function given

x = [0:0.0001:20]; % we define an interval
f = @(x) log(x) + cos(x) - 1; %define the function
plot(x,f(x)) % and plot the func on this interval

%We make things look pretty
%we add a title, labels and grids.

%Adding title
title('log(x) + cos(x) - 1') 

%Adding labels
xlabel('x') 
ylabel('f(x)')

%Adding grid
grid on 
grid minor 