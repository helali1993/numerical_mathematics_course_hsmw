%% Task 1

%% Task 1.1

% We define the function as a function handle
f = @(x, y) x + sin(y);

% We define the four corner points
x1 = -5;
y1 = -5;
x2 = 5;
y2 = 5;

% We evaluate the function at the four corner points
% and save them accordingly
Q11 = f(x1, y1);
Q12 = f(x1, y2);
Q21 = f(x2, y1);
Q22 = f(x2, y2);

% We define the Bilinear Interpolation method as function handle
P = @(x, y) (1 / ((x2 - x1) * (y2 - y1))) * [x2 - x, x - x1] * [Q11, Q12; Q21, Q22] * [y2 - y; y - y1];

%% Task 1.2

% We initialize a matrix for the random points.
% Since we have 9 points, we have 9 rows and since we
% have two coordinates, we have two columns.
random_points = zeros(9, 2);

% We assign random points to each row.
for i = 1:9
    random_points(i : i, 1 : 2) = randi([-5, 5], 1, 2);
end

random_points;

% We initialize a matrix for the interpolated solutions.
% Since we have 9 points, we have 9 rows and since we
% have a scalar solution, we have one column.
interpolated_points_values = zeros(9,1);

% for each point, we assign to it its respective interpolated value
% using P "previously defined function handle"
for i = 1:length(random_points( :, 1:1))
   interpolated_points_values(i, :) =  P(random_points(i:i, 1:1), random_points(i:i, 2:2));
end

interpolated_points_values;

% We plot our interpolated points and corner points.
figure;
plot([random_points(:,1)], [random_points(:,2)], 'xb', [-5; 5;-5;5],[-5;5;5;-5], '+r');
grid on;
title('Visualize corner points & interpolation points')

%% Task 1.3

% We initialize a matrix for the solutions.
% Since we have 9 points, we have 9 rows and since we
% have a scalar solution, we have one column.
actual_values = zeros(9, 1);

% for each point, we use the function handle f to calculate
% the value of rach respective point and save it.
for i = 1:length(random_points(:, 1))
    actual_values(i, :) = f(random_points(i:i, 1), random_points(i:i, 2));
end

% To compare the results in a neat and convenient way,
% we first create a table

comparison_table = table;

% Then, we assign headers and columns to the table.
% The first column is the values of x-coordinates.
% The second column is the values of y-coordinates.
% The third column is the values we calculated using the function handle
% f for each respective xy-coordinate.
% The fourth column is the coloums is the values we calculated using the 
% Biliniear Interpolation Method for each respective xy-coordinate.
% The fifth column is the absolute difference between the third and fourth
% coloumn.
comparison_table.x = random_points( : , 1);
comparison_table.y = random_points(:, 2);
comparison_table.Actual = actual_values;
comparison_table.Interpolated = interpolated_points_values;
comparison_table.Difference =  abs(actual_values - interpolated_points_values);

comparison_table


%% Task 1.4


% We plot each interpolated value with its respective point on the 3D Plane.
figure;
plot3(random_points(: , 1), random_points(:, 2), interpolated_points_values, '*m');
grid on;
hold on;

% We then create a mesh grid.
[X, Y] = meshgrid(-10:0.1:10, -10:10);

% We define the Z plane
Z = X + sin(Y);

%then we visualize the function using surf 
surf(X,Y,Z);
title('Visualize function & interpolated values')


