%% Example 4
% dt = 2/100 = 1/50 and h = 1/300 and c = 2
% => 1/50 > 1/(sqrt(2)*300)
% => dt > h/sqrt(c)

% Clearing Workspace
close all;
clear all;

% Intializing paramaters
c = 2;
t_max = 2;

x_min = 0;
x_max = 1;



% Intializing Steps sizes
% where x is our space coordinate
% and t is our time coordinate.
spatial_divs_ex4 = 300; 
temporal_divs_ex4 = 100; 
h = (x_max - x_min) / spatial_divs_ex4; % h = 1/300
dt = t_max / temporal_divs_ex4; % dt = 1/50

% Intializing our solution arrays to start
% our explicit difference method.
u = zeros(spatial_divs_ex4+1, 1);
u_prev = zeros(spatial_divs_ex4+1, 1);
u_next = zeros(spatial_divs_ex4+1, 1);

% Calculating the initial condition 
% given by u(x,0) = x(1-x).
for i = 1:spatial_divs_ex4+1
    x = x_min + (i-1)*h;
    u(i) = x*(1 - x);
end

%Solving using the Explicit Difference Method

%for plotting our wave later on.
figure('Name','Example 4: Conditions NOT Met','NumberTitle','off') 
x = x_min:h:x_max;


%Pr
count_for_not_nan = 0;
% We start our travel in time
for ii = 1:temporal_divs_ex4
    
    % the boundary conditions are given by:
    % u(0,t) = u(1,t) = 0 and we hardcode them.
    u(1) = 0;
    u(spatial_divs_ex4+1) = 0;
   
    % we solve for (u_i)^(m+1) given in the task description.
    for i = 2:spatial_divs_ex4
        u_next(i) = ((-1) * c * (dt^2)/(h^2)) * ((2 * u(i)) - u(i+1) - u(i-1)) + (2 * u(i)) - u_prev(i);
    end
    
    % We update our u's for the next loop.
    u_prev = u;
    u = u_next;

    %We plot and add the plot to the Frame Vector F
    plot(x, u);
    ylabel('Wave Amplitude', 'fontSize', 12);
    titlestring = ['h/sqrt(c) = ', num2str(h/sqrt(c)), ' dt = ',num2str(dt), ' t = ',num2str(ii * dt), ' secs'];
    title(titlestring ,'fontsize', 12);                            
    % We have let the movie play without the choice of the limits for 
    % our axes to provide a smoother animation.
    
    F = getframe;

end


% frames per second (fps) is set to 1 for a better 
% experience. However, this could be changed.
movie(F,1,1)



