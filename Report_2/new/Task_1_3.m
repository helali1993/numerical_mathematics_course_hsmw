%% Task 1.3

% Intialize our Matrix A and vector b.
A = [10 3 1; 3 9 2; 1 2 7];
b = [5; 8; 10];

A
b

% Perform LU decomposition on A
[L, U] = lu_decomposition(A);

% Perform Cholesky decomposition on A
[R_sym, R] = cholesky_decomposition(A);

% Perform Gauss Seidel iterative method
[X] = gauss_seidel(A, b, 1000);
X

% Solving Ax = b using LU decomposition.
X_lu = inv(U) * inv(L) * b;
X_lu = double(X_lu);

% Solving AX = b using Cholesky decomposition
X_ch = inv(R) * inv(transpose(R)) * b;
X_ch = double(X_ch);


%comparing results
value_of_X = [X_lu];
abs_diff = [abs(X - X_lu)];

compare = table(value_of_X, abs_diff);
compare = renamevars(compare, ["value_of_X", "abs_diff"], ["Vector X using LU", "Absloute difference w.r.t Gauss Seidel"]);

compare

value_of_X = [X_ch];
abs_diff = [abs(X - X_ch)];

compare_1 = table(value_of_X, abs_diff);
compare_1 = renamevars(compare_1, ["value_of_X", "abs_diff"], ["Vector X using Cholesky", "Absloute difference w.r.t Gauss Seidel"]);

compare_1

value_of_x_lu = [X_lu];
value_of_x_ch = [X_ch];
value_of_x = [X];

compare_2 = table(value_of_x_lu, value_of_x_ch, value_of_x);
compare_2 = renamevars(compare_2, ["value_of_x_lu", "value_of_x_ch", "value_of_x"], ["Vector X using LU", "Vector X using Cholesky", "Vector X using Gauss Seidel"]);

compare_2


