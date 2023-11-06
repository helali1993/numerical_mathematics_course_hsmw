%% Task 2

%% Task 2.3

% We create a random A and a random b
% and we ask what is the value of x such that
% A*x = b.
A_given = randi([-10, 10], 5);
b_given = randi([ -10, 10], 5,1);

% We decompose A into the orthonormal matrix Q and
% upper triangular  matrix R.
[Q, R] = Task_2_1(A_given);

% We use Matrix multiplication.
b_int = transpose(Q) * b_given;

% Then, we use backward elimination.
x = inv(R)* b_int;

% We now have obtained our x from our coded QR Decomposition
% function.
% We now calculate it using the built in function given
% by Matlab.
x_check = A_given \ b_given;


% We compare our results.
Diff = abs(x_check - x)
