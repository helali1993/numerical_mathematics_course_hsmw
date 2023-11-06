%% False Postion Method

% We define the Function, the output x_g is the calculated root by this
% method. The function takes five inputs; the mathematical function (eg.
% log(x) + cos(x) - 1), intial bracket for search x_p and x_n, epislions eps_f
% and eps_x for the desired precision.

%% We start the code
function [x_g, iter] = false_position_method(f, x_n, x_p, eps_f, eps_x)

% Our first guess
x_g = (x_n * f(x_p) - x_p * f(x_n))/(f(x_p) - f(x_n));

iter = 0;

%While loop iterates until root convergence is reached
while abs(f(x_g)) > eps_f || (abs(x_g - x_n) > eps_x && abs(x_g - x_p) > eps_x)
    
    
    % updating the brackets
    if f(x_g) > 0 
        x_p = x_g;
    else
        x_n = x_g;
    end
    
    % Our new guess
    x_g = (x_n * f(x_p) - x_p * f(x_n))/(f(x_p) - f(x_n));
    
    iter = iter + 1;
    
end