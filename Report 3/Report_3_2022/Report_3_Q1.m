%% Numerical Calculation

% Define the density function
f = @(t) cos(t)^2 + sin(t)^2;

% Define the parameterization function
K = @(t) [cos(t); sin(t); 2*t.^(3/2)];

syms t
k_x = cos(t);
k_y = sin(t);
k_z = 2*t^(3/2);



% Set the integration limits
a = 0;
b = 11;

% Define the number of Gauss Quadrature points
num_points = 7; 
% Get Gauss Quadrature points and weights
[points, weights] = lgwt(num_points, -1, 1); 

M = Gauss_quad_modified(f * sqrt(diff(k_x, t)^2 + diff(k_y,t)^2 + diff(k_z, t)^2), a, b, points, weights);


% Display the total mass
fprintf('The mass of the DNA between a = %.2f and b = %.2f is %.4f.\n', a, b, M);
fprintf('\n');

%% Analytical Calculation

% Define the parameterization of the DNA as a screw function
k_x_ana = @(t) cos(t);
k_y_ana = @(t) sin(t);
k_z_ana = @(t) 2*t.^(3/2);

% Define the limits of integration
a_ana = 0;
b_ana = 11;

M_ana = int(f * sqrt(diff(k_x_ana, t)^2 + diff(k_y_ana,t)^2 + diff(k_z_ana, t)^2), t, a_ana, b_ana);

% Display the result
fprintf('Calculated Analytically, The mass of the DNA between a = %.2f and b = %.2f is %.4f.\n', a_ana, b_ana, M_ana);
fprintf('\n');


%% Comparing Results

data_table = table;

data_table.Mass = [M; M];
data_table.Mass_ana = [M_ana; M_ana];
data_table.diff = [abs(M - M_ana); vpa(abs(M-M_ana))];

data_table.Properties.VariableNames([2 3]) = {'Mass Calculated Analytically' 'Absloute Difference'};

disp('A table for comparison')

data_table