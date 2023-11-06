%% Task 2

%% Task 2.2

% In order to test the function, we utilized the internet and
% we found a function provided on MathWorks that creates Orthonormal
% matrices.
% Link to source: https://de.mathworks.com/matlabcentral/fileexchange/11783-randorthmat

% We create an Orthonormal 5x5 Matrix and save it.
Q_random = RandOrthMat(5);


% We create a random 5x5 matrix with range up to 5
R_random = randi(5,5);

% We iterate on R_random in order to modify it 
% into an upper triangular  matrix.
for i = 1 : 5
    for j =  1 : i - 1
        R_random(i, j) = 0;
    end
end

% We calculate A = Q * R
A_random = Q_random * R_random;

% We use our coded function to decompose A again.
[Q_test, R_test] = Task_2_1(A_random);

% We calculate A using our decomposed Q and R.
A_test = Q_test * R_test;

% We compare our results.
Diff = abs(A_test - A_random)
