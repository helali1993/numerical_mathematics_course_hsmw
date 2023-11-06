%% Task 6
%Compare all three methods qualitatively 
% (number of iterations, convergence,...).

% We initalize the mathematical function  
f = @(x) log(x) + cos(x) - 1;

% Set the interval [a, b] where the root is located
a = 2;
b = 5;
x0 = 4;

% Set the tolerance & maximum number of iterations

tol = 1e-4;
maxiter = 1000;


% We calculate the root using False Position Method & plot it

[root_ridder, iter_ridder] = ridder(f, a, b, tol, maxiter);

[root_false, iter_false] = false_position_method(f, a, b, 1e-4, 1e-4);

[root_fixed, iter_fixed] = fixed_point_method(x0, tol, maxiter);

name_of_method = ["Ridder's"; "False Position"; "Fixed Point"];
roots = [root_ridder;root_false; root_fixed];
number_iter = [iter_ridder;iter_false;iter_fixed];
convergence = ["does";"does"; "does"];

compare = table;

compare.Method = name_of_method;
compare.Root = roots;
compare.No_Of_Iterations = number_iter;
compare.Converges = convergence;

 compare = renamevars(compare,["No_Of_Iterations","Converges"],["No of Iterations","Converges?"]);


compare
