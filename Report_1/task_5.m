%% Task 5
%Write a Matlab script finding one root based on the Fixed point
%iteration method. Make yourself familiar with this method.


% Define the initial guess and tolerance
x0 = 3.5;
tol = 1e-4;

% Set the maximum number of iterations
maxiter = 1000;

% Call the function to find the root and number of iterations
[root, iter] = fixed_point_method(x0, tol, maxiter);

% Print the results
fprintf('The root of f(x) is %f.\n', root);
fprintf('Number of iterations: %d.\n', iter);