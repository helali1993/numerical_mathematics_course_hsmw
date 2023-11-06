%% Local Extrema
% The Differentiation method used here is
% The Forward Difference method.


% The function has 4 inputs
%  %% a and b form up the interval.
%  %% h is the step.
%  %% y is a function handle and is the function 
%     that we are going to calculate its local extrema.
% The function has 2 outputs
%  %% localmin is a row vectors, it will contain the
%     the x-coordinates of the local minimums.
%  %% localmax is a row vectors, it will contain the
%     the x-coordinates of the local maximums.

function [localmin, localmax] = extrema(a, b, h, y)

% Making sure that the interval is valid.
    if a > b
        msg = 'the chosen interval is invalid';
        error(msg)
    end
    
% creating the vector X
    X = a:h:b;
    
% Inizalizing the row vector first_diff.
% This vecor is a boolean map, to save the position 
% of the points that satisfied the first dervative test.
    first_diff = zeros(1, length(X));

% Inizalizing the row vector DYDX
% This vector contains the actual derivative value 
% for each point.
% This Vector was mainly used for debugging.
    DYDX = zeros(1, length(X));
    
    for i = 1:length(X) - 1
        dydx = (y(X(i) + h) - y(X(i)))/h;
        DYDX(i) = dydx;
        if abs(dydx) <= h
            first_diff(i) = i;
        end
    end
    
    first_diff(length(X)) = length(X);
    
    
    second_diff = zeros(1, length(X));
    
    min = 0;
    max = 0;
    
    localmax_temp = zeros(length(X), 1);
    localmin_temp = zeros(length(X), 1);
    
    
    
    for i = 2:length(first_diff) - 1
        if first_diff(i) ~= 0
            second_diff(i) = (y(X(i) + h) - 2 * y(X(i)) + y(X(i) - h))/ (h^2);
            
            if second_diff(i) < 0
                max = max + 1;
                localmax_temp(max) = X(i);                
            end
        
            if second_diff(i) > 0
                min = min + 1;
                localmin_temp(min) = X(i);       
            end
        
        end
    end
    
    if y(a) < y(a + h)
        min = min + 1;
        localmin_temp(min) = a;
            
     elseif y(a) > y(a+h)
        max = max + 1;
        localmax_temp(max) = a;
        
     end
        
     if y(b-h) < y(b)
         max = max + 1;
        localmax_temp(max) = b;
     elseif y(b-h) > y(b)
        min = min + 1; 
        localmin_temp(min) = b;
     end
      
     localmin = zeros(1, min);
     localmax = zeros(1, max);
     
     
     for i = 1:min
         localmin(i) = localmin_temp(i);
     end
     
     for i = 1:max
         localmax(i) = localmax_temp(i);
     end
     
     
    
    
    
    
    
    
    