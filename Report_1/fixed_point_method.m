%% Fixed Point Method

function [root, iter] = fixed_point_method(x0, tol, maxiter)
% This function finds a root of a function f(x) using the false position
% method given the interval [a,b], the tolerance tol, and the maximum
% number of iterations maxiter.

% Initialize the iteration counter and error
iter = 0;
err = inf;

root = NaN;


%this is our solution for g(x) = x.
%our first trial was with the function;
% g(x) = exp(1 - cos(x)). However,
%when using that g(x) the code always reached 
%max iterations. Multiple x0 where chosen and we increased the
%no of max iteration. The below function, satisfied the conditions
%required on g(x). ( |g'(x)| < 1). And the code does converge, however,
%the diference with fzero's solution is ~ 0.8.
g = @(x) exp(1-cos(x))/2.062;

% Start the fixed point iteration
while err > tol && iter < maxiter
    x1 = g(x0);
    err = abs(x1 - x0);
    x0 = x1;
    iter = iter + 1;
end

root = x1;
end
