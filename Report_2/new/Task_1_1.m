%% Task 1.1

% Example 1 where LU decomposition is possible

disp("-----------------")
disp("First Example")

%Initalizing Matrix A
A = [1 2 3 11; 4 7 2 3; 5 6 7 0; 11 5 9 1];
A

% Performing LU decomposition using our written method
[L_m, U_m] = lu_decomposition(A);

% Checking if LU decomposition is unique 
bool_unique =check_lu_unique(L);
if bool_unique
    disp("LU decomposition is unique")
else
     disp("LU decomposition is not unique")
end
fprintf(1, '\n');


%Performing LU decompostion using builtin method
A = sym(A);
[L, U] = lu(A);


%Comparing results 
disp("Absloute difference between our resulting L and builtin L")
abs(L - L_m)

disp("Absloute difference between our resulting U and builtin U")
abs(U - U_m)


%Solving Ax = b 
b = [1; 3; 4; 3];

x = inv(U_m) * inv(L_m) * b;


%Comparing our results
disp("Absloute difference between A*x and the vector b")
abs( A * x - b)


%Solving Ax = b for a differnet vector b 
b = [5; 6; 7; 8];

x = inv(U_m) * inv(L_m) * b;

%Comparing our results
disp("Absloute difference between A*x and the vector b")
abs( A * x - b)


% Example 2 where LU decomposition is possible
disp("-----------------")
disp("Second Example")

%Initalizing Matrix A
A = [1 2 3 11 17; 4 7 2 3 23; 5 6 7 0 33; 11 5 9 1 90; 4 12 93 43 12];
A


% Performing LU decomposition using our written Method
[L_m, U_m] = lu_decomposition(A);

% Checking if LU decomposition is unique 
bool_unique =check_lu_unique(L);
if bool_unique
    disp("LU decomposition is unique")
else
     disp("LU decomposition is not unique")
end
fprintf(1, '\n');

% Performing LU decomposition using builtin method
A = sym(A);
[L, U] = lu(A);


% Comparing our results
disp("Absloute difference between our resulting L and builtin L")
abs(L - L_m)

disp("Absloute difference between our resulting U and builtin U")
abs(U - U_m)

% Solving Ax = b
b = [34; 3; 16; 24; 50];

x = inv(U_m) * inv(L_m) * b;

%Comparing our results
disp("Absloute difference between A*x and the vector b")
abs( A * x - b)


% Example 3 where LU decomposition is not possible
disp("-----------------")
disp("Example where A is Singular")

% Initalizing Matrix A
A = [2 3 2; 4 7 9; 6 9 6];
A

% Performing LU decomposition with our written method
% will obtain a message stating that A is Singular.
[L_m, U_m] = lu_decomposition(A);


% Example 4 where LU decomposition is not possible
disp("-----------------")
disp("Example where A has a zero pivot")

% Initalizing Matrix A
A = [ 2 1 3; 6 3 7; 8 11 13];
A

% Performing LU decomposition with our written method
% will obtain a message stating that A does not fullfill the Pivot Element Requirmenet.
[L_m, U_m] = lu_decomposition(A);

