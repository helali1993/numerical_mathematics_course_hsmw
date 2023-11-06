%% Length Of A Curve
% This functions calculates the given formula S
% The Integration method used here is
% the Trapezoidal rule of Integration.

% The function takes the following inputs
%   %% a and b are the interval.
%   %% h is the step.
%   %% y1 is a Symbolic expression and in essence is 
%      the function we are calculating the length for.
% The function outputs the integral value.

function [sol] = length_of_curve(a, b, y1, h)
  
% We declare that x is symbolic
% and create a function handle form y1 and save it in y.
  syms x 
  y = matlabFunction(y1);
  
% We evaluate the derivative.  
  dydx = eval(['@(x)' char(diff(y(x)))]);

% We create the vecotr X.
  X = a:h:b;
  
% We initalize the output.
  sol = 0;
  
% We use the Trapezoid method special case
% provided in lecture 8, page 17.

% We loop on the vector X and calculte the summand.
% We follow the formula and start from the second
% entry of the vector to the entry before last.
   for n = 2:(length(X) - 1)
      sol = sol + sqrt(1 + (dydx(X(n)))^2);
   end
  
  % We calculate the part preceding the summation. 
  sol = ((1/2) * (dydx(X(1)) + dydx(X(length(X))))) + sol;
  sol = h * sol;
  
end

