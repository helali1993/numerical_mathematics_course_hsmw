%% Check Uniquness of LU Decomposition
% According to "Taboga, Marco (2021). "LU decomposition", 
% Lectures on matrix algebra. 
% https://www.statlect.com/matrix-algebra/lu-decomposition. 
% in section "How to make the LU and PA=LU decompositions unique"
% Proposition 
% Let A be a KxK matrix and P a KxK permutation matrix such that PA has an LU decomposition. 
% Then, if A is invertible, there are a unique KxK lower triangular matrix L 
% having all diagonal entries equal to 1 and a unique KxK upper triangular matrix U 
% such that: PA = LU.
% Note that the proposition above applies also to matrices 
% that do not need to be permuted to have an LU factorization 
% (i.e., when P=I). 

%% Function [bool_unique] = check_lu_unique(A, bool)
% takes a matrix A and a boolean and checks if it is
% a unique LU decomposition.
% input bool is used wether to indicate that the LU decomposition
% has already been performed and we are checking A a lower triangle matrix.
% if bool is false, we perform the LU decomposition and then check its
% uniquness.
% outputs boolean bool_unique; true i LU decomposition is unique
% false otherwise.


function [bool_unique] = check_lu_unique(A, bool)
    
    % initalizing input bool if not passed
    %in the call of the function
    if nargin < 2
        bool = true;
    end

    bool_unique = true;
    
    % Performing the LU decomposition if not yet performed.
    if bool ~= true
        [L, U] = lu_decomposition(A);
        disp("Matrix given was not in LU from, preformed LU Decomposition");
        A = L;
    end

    [m, n] = size(A);

    % Iterating over the diagonal to check
    % that all entries are equal to one.
    for i = 1 : m
        if A(i, i) ~= 1
            bool_unique = false;
            return;
        end
    end
end


