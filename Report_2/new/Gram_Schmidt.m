%% Task 2

%% Task 2.1

% The functions take as input any real matrix and decomposes it
% into an orthonormal matrix Q and an upper triangular matrix R.
% Q and R are the output.
function [Q , R] = Gram_Schmidt(A)
    
    R(1,1) = norm(A( :, 1));
    Q( : , 1) = (1/R(1,1)) * A(:, 1);
     
    for k = 2:length(A(1, :))
         Q( : , k) = A( : , k);
        for j = 1 : k-1
            R(j,k) = dot(Q( :, j), A( : , k));
            Q( :, k) = Q( :, k) - (R(j,k)/dot(Q( :, j),Q( :, j))) * Q( :, j);
        end
        Q( :, k) = Q( :, k)/ norm(Q( : , k));
        R(k, k) = dot( Q( : , k), A( : , k));
    end  


end

    