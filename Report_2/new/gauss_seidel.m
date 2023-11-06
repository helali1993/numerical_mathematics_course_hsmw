%% Gauss Seidel Iterative Method
% cite the following youtube video.
% https://www.youtube.com/watch?v=2FY3W3zFDeM
% Gauss-Seidel Method with MATLAB code
% by: ATTIQ IQBAL
% cite the following youtube video:
% https://www.youtube.com/watch?v=pQVqaiFBvoU
% Gauss-Seidel Method | Numerical Methods
% by: StudySession

function [X] = gauss_seidel(A, B, numIter)

    %Check A is square
    [m, n] = size(A);

    if m ~= n
        disp("A is not square!!!");
        return
    end

    %check that A and B are compatiable
    [b_m, ~] = size(B);

    if b_m ~= m
        disp("A and B are not compatiable!!!")
        return
    end

    %check A is diagonally dominated
    for i = 1 : n
        if abs(A(i,i)) < abs(sum(A(i:i-1, 1: i-1)) + sum(A(i, i+1 : n)))
            disp("A is not diagonally dominated")
            return
        end
    end

    X = zeros(n,1);
    XTemp = zeros(n,1);

    e = 0.0001;
    

    iter = 1;
    
    % Performing the iterative calculations
    % using the formulas.
    while iter < numIter
        XPrev = X;
        for i = 1 : n
            X(i) = (B(i)/A(i,i)) - ( A(i, [1:i-1, i+1:n]) * XTemp([1:i-1, i+1:n]))/A(i,i);
            XTemp(i) = X(i);
        end
        iter = iter + 1;
        % Check if within acceptable tollerance range.
        if abs(XPrev - X) < e
            break
        end
    end
    X;
end



