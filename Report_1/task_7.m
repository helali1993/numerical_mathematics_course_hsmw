%% Task 7
% Compare your results with the built in function fzero.

% We initalize the mathematical function  
f = @(x) log(x) + cos(x) - 1;


% We calculate the root using the built_in function.
root_fzero = fzero(f,3);

% We plot it
plot(root_fzero, f(root_fzero), '+')

hold on

% Set the interval [a, b] where the root is located
a = 2;
b = 5;

% Set the tolerance & maximum number of iterations

tol = 1e-4;
maxiter = 100;


% We calculate the root using Ridder's Method & plot it
[root_ridder, iter_ridder] = ridder(f, a, b, tol, maxiter);
plot(root_ridder, f(root_ridder), '*')

% We calculate the root using False Position Method & We plot it
[root_false, iter_false] = false_position_method(f, 0.01, 11, 1e-6, 1e-6);
plot(root_false, f(root_false), 'o')

% We make things pretty
grid on

legend('fzero',  'Ridders', 'False Positon')
title("Difference bet. fzero, Ridder's & False Position")


ylim([-1 1]);

%Due to the huge difference in the result of the 
%fixed position method,we plot it in a figure on
%its own with fzero's root

% We calculate the root using Fixed Point Method & We plot it
[root_fixed, iter_fixed] = fixed_point_method(x0, tol, maxiter);

figure
plot(root_fzero, f(root_fzero), '+')
hold on
grid on
plot(root_fixed, f(root_fixed), 'd')

legend('fzero',  'Fixed Point Method')
title("Difference bet. fzero & Fixed Point")

ylim([-1 1]);
xlim([3.2 4.8])






name_of_method = ["False Position"; "Ridder's"; "Another False Position"; "Fixed Point"];
roots = [root_false; root_ridder; root_false; root_fixed];
difference = [root_false - root_fzero; root_ridder - root_fzero; root_false - root_fzero; root_fixed - root_fzero];

compare = table(name_of_method, roots, difference);
compare = renamevars(compare, ["name_of_method", "roots", "difference"], ["Method", "Resulted Root", "Difference w.r.t fzero"]);

compare




