%% Function [R_sym, R] = cholesky_decomposition(A)
% the fiunction takes a matrix A. If A fullfills criteria,  
% it decomposes the matrix into R^(T)R. 
% The output R_sym is simply also R but in sym(R) notation,
% as it is sometimes easier to check using sym(R).

function [R_sym, R] = cholesky_decomposition(A)

    % Initializing variables.
    R = nan;
    R_sym = nan;

    % Checking that A is Hermitian.
    if ~ishermitian(A)
        disp("A is not hermitian!!!");
        return
    end
    

    
    %Checking that A is positive definite.
    eigen_values = eig(A);

    for i = 1 : size(eigen_values)
        if eigen_values(i) <= 0 
            disp("A is not positive definite")
            return
        end
    end

    %Preparing for iteration
    [m, n] = size(A);
    U = zeros(n, n);
    sum = 0;

    % Iterating over the Matrix A
    % and computing Matrix R using the formulas.
    for k = 1 : n
        for i = 1 : k
            if i ~= k
                for j = 1 : i - 1
                    sum = sum + U(i, j) * U(k, j);
                end
                U(k, i) = (A(k, i) - sum) / U(i,i);
            else
                for j = 1 : i - 1 
                    sum = sum + U(k , j) * U(k , j);
                end
                U(k,k) = sqrt(A(k,k) - sum);
            end
            sum = 0;
        end
    end

    % We obtain in the end U, however U is in upper triangle form
    % so we transpose to obtain the lower triangle form.
    R = transpose(U);
    R_sym = sym(R);

end