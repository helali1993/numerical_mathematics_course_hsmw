a1 = 1.00;  
b1 = 0.10;
a2 = 0.50;
b2 = 0.02;

prey = 100;
predator = 20;
t = 40;
h = 0.1;

pop = zeros(t/h, 2);
prey_t = zeros(t/h, 2);
predator_t = zeros(t/h, 2);

for i = 1:t/h

    pop(i, 1) = prey;
    pop(i, 2) = predator;

    prey_t(i, 1) = h*i;
    prey_t(i, 2) = prey;

    predator_t(i, 1) = h*i;
    predator_t(i, 2) = predator;

    dpdt = (a1 - b1 * predator) * prey;
    drdt = (-a2 + b2 * prey) * predator;
    

    prey = prey + h*dpdt;
    predator = predator + h*drdt;

end

figure
plot(prey_t(:, 1), prey_t(:, 2), "b", predator_t(:, 1), predator_t(: , 2), "r");


figure
plot(pop(:, 1), pop(:, 2));

p_bn = 100;
r_bn = 20;

animals = [p_bn; r_bn];

f = @(t_for_bn, animals) [(a1 - b1 * animals(2)) * animals(1); (-a2 + b2 * animals(1)) * animals(2)];
[t_bn, pop_bn] = ode45(f, [0 t], animals);

figure
plot(t_bn,pop_bn);


figure
plot(pop_bn(:,1),pop_bn(:,2));


prey = 10;
predator = 25;
t = 40;
h = 0.1;

pop = zeros(t/h, 2);
prey_t = zeros(t/h, 2);
predator_t = zeros(t/h, 2);

for i = 1:t/h

    pop(i, 1) = prey;
    pop(i, 2) = predator;

    prey_t(i, 1) = h*i;
    prey_t(i, 2) = prey;

    predator_t(i, 1) = h*i;
    predator_t(i, 2) = predator;

    dpdt = (a1 - b1 * predator) * prey;
    drdt = (-a2 + b2 * prey) * predator;
    

    prey = prey + h*dpdt;
    predator = predator + h*drdt;

end

figure
plot(prey_t(:, 1), prey_t(:, 2), "b", predator_t(:, 1), predator_t(: , 2), "r");


figure
plot(pop(:, 1), pop(:, 2));

