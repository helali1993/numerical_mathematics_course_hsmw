%% Numerical Calculation

% Define the curve K(t)
syms t
x_t =  t^2;
y_t = t + 1;
z_t =  t - 2;

% Define the interval
t_start = 0;
t_end = 1;

% Define the vector Field F * dx
f_x_dx = 2*x_t*z_t * 2 *t;
f_y_dy = (2*x_t - 11*z_t + 1) * y_t^(-1) * z_t^(-2);
f_z_dz = -3 * y_t * z_t * 1;



% Define the number of Gauss Quadrature points
num_points = 7; 
% Get Gauss Quadrature points and weights
[points, weights] = lgwt(num_points, -1, 1);  

% Calculate the work using Gauss Quadrature
W_x = Gauss_quad_modified(f_x_dx, t_start, t_end, points, weights);
W_y = Gauss_quad_modified(f_y_dy, t_start, t_end, points, weights);
W_z = Gauss_quad_modified(f_z_dz, t_start, t_end, points, weights);
W = W_x + W_y + W_z;

% Display the result
fprintf('The work W along the curve K is approximately: %.4f\n', W);
fprintf('\n');

%% Analytical Calculation


syms x y z t

% Define the vector field F component-wise
F = [2*x*z; (2*x - 11*z + 1)/(y*z^2); -3*y*z];

% Define the parameterization of the curve K
x_t_ana = t^2;
y_t_ana = t + 1;
z_t_ana = t - 2;

% Compute the work analytically component-wise
W_x_ana = int(subs(F(1), [x, y, z], [x_t_ana, y_t_ana, z_t_ana]) * diff(x_t_ana, t), t, 0, 1);
W_y_ana = int(subs(F(2), [x, y, z], [x_t_ana, y_t_ana, z_t_ana]) * diff(y_t_ana, t), t, 0, 1);
W_z_ana = int(subs(F(3), [x, y, z], [x_t_ana, y_t_ana, z_t_ana]) * diff(z_t_ana, t), t, 0, 1);

% Compute the total work
W_ana = W_x_ana + W_y_ana + W_z_ana;

% Display the result
disp(['The work W along the curve K analytically is: ' char(W_ana)]);
fprintf('\n');

W_d_ana = vpa(W);

disp(['The work W along the curve K analytically is also: ' char(W_d_ana)]);
fprintf('\n');


%% Comparing Results

data_table = table;

data_table.Work = [W; W];
data_table.Work_ana = [W_ana; W_d_ana];
data_table.diff = [abs(W - W_ana); abs(W - W_d_ana)];

data_table.Properties.VariableNames([2 3]) = {'Work Calculated Analytically' 'Absloute Difference'};

disp('A table for comparison')

data_table



