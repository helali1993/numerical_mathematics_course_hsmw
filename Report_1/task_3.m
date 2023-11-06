%% Task 3
% Write  a Matlab script finding one root 
% based on the false position.

% We intialize our mathematical function.
f = @(x) log(x) + cos(x) - 1;

% We call the False Position Function 
% We pass the intialized function f, our intial bracket for search '2'
% and '5', our desired precision in the epsilons '1e-4'.
[root, iter] = false_position_method(f, 2, 5, 1e-4, 1e-4);

if ~isnan(root)
    fprintf('The root of f(x) is %f.\n', root);
    fprintf('Number of iterations: %d.\n', iter);
end