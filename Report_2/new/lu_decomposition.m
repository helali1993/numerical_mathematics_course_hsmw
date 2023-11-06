%% Function [L, U, bool_unique] = lu_decomposition(A)
% the function lu_decompostion  takes the Matrix A as input
% and decomposes A into the matricies L, U if all prerequistes 
% on A are fullfilled. 


function [L, U] = lu_decomposition(A)
    
    %Obtain dimensions of Matrix A
    [m, n] = size(A);
    
    % Initalization of Variables

    % The matrix E will save the product of the elimination matricies
    % performed on A. i.e. EA = U.
    E = eye(n);
    E = sym(E);

    % Initialization of the lower triangle matrix
    L = eye(n);
    
    % Initialization of the upper triangle matrix U.
    U = eye(n);
    
    % check A is square
    A = sym(A);
    [m, n] = size(A);
    if m ~= n
        disp("A is not square!!!");
        return
    end

    %check if A is Invertible
    det_a = det(A);
    if det_a == 0
        disp("A is a Singular Matrix!!!");
        return
    end

    

    % check the Pivot Element Requirment
    for i = 1 :m
        if A(i, i) == 0
            disp("A does not fullfill the Pivot Element Requirment!!!");
            return
        end
    end

    % Computing of E and U through Gaussian Elimination.
    for i = 1 : m
        for j = 1 : m
            if i ~= j
                % Checking if during Gaussian Elimination on A,
                % we obtain a zero pivot.
                if A(i,i) == 0
                    disp("A does not fulfill the Pivot Element Requirment!!!");
                    return
                end

                % Updating A and E. T is the Elimination Matrix in this
                % iteration. A will be assigned to U at the end of the
                % algorithm.
                if A(j, i) ~= 0 && j > i
                    T = eye(n);
                    T = sym(T);
                    T(j, i) =  (-1) * A(j, i) * 1/A(i,i);
                    A(j , :) = (-1) * A(j, i) * A(i,  1 : n) * 1/A(i,i) + A(j , :);
                    E = T * E;
                end
            end
        end
    end
    
    
    % Our lower triangle matrix is the inverse of elimination matricies
    % done in the reverse order.
    % EA = U <=> A = E^(-1)U
    % <=> A = LU <=> L = E^(-1).
    L = inv(E);
    U = A;

end






