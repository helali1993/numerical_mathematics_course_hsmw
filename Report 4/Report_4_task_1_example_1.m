%% Task 1: Lorenz System


%% Cleaning Workspace
clear all;
close all;

%% Chaotic Behaviour 
% Example 1

% Initialization Parameters
% rho > 24.74 (Choatic Behaviour)
sigma = 10;
beta = 8/3;
rho = 28;

% Creating time interval and step
dt = 0.01;
t = 0.0:dt:100;

% Intializing our function variables
x = zeros(size(t));
y = zeros(size(t));
z = zeros(size(t));

% Applying inital conditions on function variables
% x = y = z = 1
x(1) = 1;
y(1) = 1;
z(1) = 1;


% Using Euler Forward Scheme of first order
% to solve non-linear ODE system.
for i = 1:(length(t) - 1)
   
   x(i + 1) = x(i) + dt * (sigma * (y(i) - x(i)));
   y(i + 1) = y(i) + dt * ( ( x(i) * (rho - z(i)) ) - y(i));
   z(i + 1) = z(i) + dt * (x(i) * y(i) - beta * z(i));
    
end

% We plot our results
figure('Name','Example 1: Chaotic Behaviour','NumberTitle','off')
plot3(x,y, z, "g");


% Built in solution
% f_bn is the vector containg the three differential equations.
% xyz is the vector containg our free functional variables,
% with xyz(1) is for x, xyz(2) is for y and xyz(3) is for z.
f_bn = @(t,xyz) [sigma * (xyz(2) - xyz(1)); (xyz(1) * (rho - xyz(3))) - xyz(2);xyz(1) * xyz(2) - beta * xyz(3)];

% using the builtin function "ode45" to solve the system.
% our time interval is [0 100] and is in our own implementation
% we set the intial conditions to x = y = z = 1.
[t,xyz] = ode45(f_bn,[0 100],[1 1 1]);

% Plotting the results from the builtin function
figure('Name','Builtin Example 1: Chaotic Behaviour','NumberTitle','off')
plot3(xyz(:,1),xyz(:,2),xyz(:,3), "b")


% Plotting the results of our implementation aganist
% the builtin fucntion.
figure('Name','Compare with Builtin: Chaotic Behaviour','NumberTitle','off')
plot3(x,y, z, "g", xyz(:,1), xyz(:,2),xyz(:,3), "b");
disp_leg = legend;
disp_leg.String{1} = "Implementation";
disp_leg.String{2} = "Builtin";

