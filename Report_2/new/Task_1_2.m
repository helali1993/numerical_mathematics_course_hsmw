%% Task 1.2

% Example 1 where Cholesky decomposition is possible.
disp("--------------")
disp("Example 1")

A = [ 6 15 55; 15 55 225; 55 225 979];
A

% Calculate cholesky decomposition using our written method

[R_sym, R_m] = cholesky_decomposition(A);

% Calculate Cholesky decomposition using built in function

[R] = chol(A);

%Comparing results
disp("Absloute difference between our R in double precision and builtin R")
abs(R - R_m)
R
R_m

disp("Absloute difference between our R using sym(R) and builtin R")
abs(R - R_sym)
R
R_sym

% Example 2 where cholesky decomposition is possibe
disp("--------------")
disp("Example 2")

A = [5 2; 2 1];
A

% Calculate cholesky decomposition using our written method

[R_sym, R_m] = cholesky_decomposition(A);

% Calculate Cholesky decomposition using built in function

[R] = chol(A);

%Comparing results
disp("Absloute difference between our R in double precision and builtin R")
abs(R - R_m)
R
R_m

disp("Absloute difference between our R using sym(R) and builtin R")
abs(R - R_sym)
R
R_sym

% Example 3 where cholseky decomposition is not possible
disp("----------------")
disp("Example 3")

A = [3 3 3; 5 6 7; 3 9 10];
A

% Performing Cholesky decomposition using our written method
% will obtain message that the matrix A is not Hermitian.

[R_sym, R_m] = cholesky_decomposition(A);


% Example 4 where cholseky decomposition is not possible
disp("----------------")
disp("Example 4")

A = [-6 15 55; 15 -55 225; 55 225  -979];
A

% Performing Cholesky decomposition using our written method
% will obtain message that the matrix A is not positive definite.

[R_sym, R_m] = cholesky_decomposition(A);

