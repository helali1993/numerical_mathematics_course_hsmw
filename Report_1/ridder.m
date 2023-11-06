%% Ridder's Method

function [root, iter] = ridder(f, a, b, tol, maxiter)
%Find a root of a given function within an interval using Ridder's method.
%[root,iter] = ridder(f, a, b, tol) finds a root of the function F within the
%interval [a, b] to within the tolerance tol, using Ridder's method.
%The function f should be a handle to a function that takes a scalar input
%and returns a scalar output. Also returns the number of
%   iterations performed, up to a maximum of maxiter.

% Set default values for input arguments
if nargin < 5
    maxiter = 100;
end
if nargin < 4
    tol = 1e-4;
end

% Initialize variables
iter = 0;
err = inf;

% Loop until the desired tolerance or maximum number of iterations is reached
while err > tol && iter < maxiter
    % Compute the values of f at a and b
    fa = f(a);
    fb = f(b);
    
    % Check if the interval is small enough
    if abs(b-a) < tol
        root = (a+b)/2;
        return;
    end
    
    % Compute the next estimate of the root using Ridder's method
    c = (a+b)/2;
    fc = f(c);
    d = (a+c)/2;
    fd = f(d);
    e = (b+c)/2;
    fe = f(e);
    s = sqrt(fc^2 - fe*fd);
    if s == 0
        root = NaN;
        return;
    end
    dx = (c-d)*fc/s;
    if (fc*fd) > 0
        dx = -dx;
    end
    x = c + dx;
    fx = f(x);
    
    % Check if x is a root or update the interval
    if abs(fx) < tol
        root = x;
        return;
    elseif (fc*fx) < 0
        b = x;
    else
        a = x;
    end
    
    % Update the error and iteration counter
    err = abs(dx);
    iter = iter + 1;
end

% If the maximum number of iterations is reached, set the root to NaN
root = NaN;
end
