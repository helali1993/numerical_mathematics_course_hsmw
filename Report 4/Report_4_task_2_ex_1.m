%% Example 1
% dt = 2/600 = 1/300 and h = 1/100 and c = 2
% => 1/300 < 1/(100*sqrt(2))
% => dt < h/sqrt(c)

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
spatial_divs_ex1 = 100; 
temporal_divs_ex1 = 600; 
h = (x_max - x_min) / spatial_divs_ex1; % h = 1/100
dt = t_max / temporal_divs_ex1; % dt = 1/300

% Intializing our solution arrays to start
% our explicit difference method.
u = zeros(spatial_divs_ex1+1, 1);
u_prev = zeros(spatial_divs_ex1+1, 1);
u_next = zeros(spatial_divs_ex1+1, 1);

% Calculating the initial condition 
% given by u(x,0) = x(1-x).
for i = 1:spatial_divs_ex1+1
    x = x_min + (i-1)*h;
    u(i) = x*(1 - x);
end

%Solving using the Explicit Difference Method

%for plotting our wave later on.
figure('Name','Example 1: Conditions Met','NumberTitle','off') 
x = x_min:h:x_max;
% If all solutions are used, animation is very slow.
% so not all soloutions are used. 
% It is possible to increase the speed of the animation 
% even more by increasing the step of plot_iter. 
plot_iter = 1 : 3 : temporal_divs_ex1;
% We start our travel in time
for ii = 1:temporal_divs_ex1
    
    % the boundary conditions are given by:
    % u(0,t) = u(1,t) = 0 and we hardcode them.
    u(1) = 0;
    u(spatial_divs_ex1+1) = 0;
   
    % we solve for (u_i)^(m+1) given in the task description.
    for i = 2:spatial_divs_ex1
        u_next(i) = ((-1) * c * (dt^2)/(h^2)) * ((2 * u(i)) - u(i+1) - u(i-1)) + (2 * u(i)) - u_prev(i);
    end
    
    % We update our u's for the next loop.
    u_prev = u;
    u = u_next;
    %Time skip is too small and there is too much frames.
    % The animation is slow. 
    % So we only choose specific solutions to plot.
    if ismember(ii, plot_iter)
        %We plot and add the plot to the Frame Vector F
        plot(x, u);
        ylabel('Wave Amplitude', 'fontSize', 12);
        titlestring = ['h/sqrt(c) = ', num2str(h/sqrt(c)), ' dt = ',num2str(dt), ' t = ',num2str(ii * dt), ' secs'];
        title(titlestring ,'fontsize', 12);                            
        % We have let the movie play and then choose the limits of 
        % our axes to provide a smoother animation.
        axis([x_min x_max -30 30]);
        F = getframe;
    end

end

% frames per second (fps) is set to 10 for a better 
% experience. However, this could be changed.
movie(F,1,10)
