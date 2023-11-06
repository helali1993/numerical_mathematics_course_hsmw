%% Task 4
%Write a Matlab script finding one root based on the Ridder’s method.
%This method is based on the false position method.

% We intialize our mathematical function
f = @(x) log(x) + cos(x) - 1;

% Set the interval [a, b] where the root is located
a = 2;
b = 5;

% Set the tolerance for the root
tol = 1e-4;

% Set the maximum number of iterations
maxiter = 100;

% Call the function to find the root and number of iterations
[root, iter] = ridder(f, a, b, tol, maxiter);

% Print the results
fprintf('The root of f(x) is %f.\n', root);
fprintf('Number of iterations: %d.\n', iter);
