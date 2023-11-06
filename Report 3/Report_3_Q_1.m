%% Integration

disp("We are going to calculate the lenght of a curve.")
disp("To begin, we need some input first.")
disp("Ready!! Let's Go!")


prompt = "OK, choose the start of your interval.\n";

a = input(prompt);
check = isnumeric(a);

if ~check
    error("The start of the interval should be a number.");
end


prompt = "Cool! Now, choose the end of your interval.\n";

b = input(prompt);
check = isnumeric(b);
if ~check
    error("The start of the interval should be a number.");
end

if a > b
        msg = 'the chosen interval is invalid';
        error(msg)
end


prompt = "Now for the good part, write down your function.\n Your variable is x by the way.\n";

syms x
y1 = input(prompt);

y = matlabFunction(y1);

disp("Ahm...we kinda need your help here!")
prompt = "What's the order of your function?\n";

hi_p = input(prompt);
check = isnumeric(hi_p);
if ~check
    error("The start of the interval should be a number.");
end


disp("Thanks!!")
disp("Abra Cadbra! The length of the curve is...")

abra_cadbra = length_of_curve_gauss(a, b, y, hi_p);

disp("Let's see how we fared aganist Matlab builtin function.")

S1 = eval(['@(x)' char(diff(y(x)))]);
S2 = eval([char(sqrt( 1 + (S1(x)).^2))]);
S3 = vectorize(inline(S2,0));

S = matlabFunction(S3(x));

matlab_sol = integral(S, a, b);

disp("Matlab's Solution is...")

matlab_sol


disp("The difference between the solutions is...")

diff_acc = abs(abra_cadbra - matlab_sol);

diff_acc

%% Differentiation

disp("We will now differinitate the inputed function.")
disp("We will use the Forward Scheme.")
disp("We will use the same interval.")

prompt = "But you get to choose the step!\n";

h = input(prompt);

if h >= abs(a - b)
    error('step is too large, choose something smaller');
end

X = a:h:b;

DYDX = zeros(1, length(X));
Y = zeros(1, length(X));
YH = zeros(1, length(X));
    
for i = 1:length(X) - 1
    YH(i) = y(X(i) + h);
    Y(i) = y(X(i));
    dydx = (YH(i) - Y(i))/h;
    DYDX(i) = dydx;
    
end
    
DYDX(length(X)) = (y(X(i)) - y(X(i)))/h;

data_table = table;

step_for_table = idivide(length(X), int16(100));

data_table.x = transpose(X(1:step_for_table:end ));
data_table.y_x = transpose(Y(1:step_for_table:end)) ;
data_table.y_x_h = transpose(YH(1:step_for_table:end));
data_table.Dervative = transpose(DYDX(1:step_for_table:end));

data_table.Properties.VariableNames([2 3 4]) = {'y(x)' 'y(x + h)' 'Derivative at x'}

disp('Here are some of the results')

data_table






