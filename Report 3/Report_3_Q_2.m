y = @(x) (1-cos(2*pi*0.01*x)).*sin(2*pi*0.15*x);

[localmin, localmax] = extrema(1, 100, 0.01, y);

x = 1:0.01:100;

values = zeros(length(localmin) + length(localmax), 1);

for i = 1:length(localmin)
    values(i, 1) = localmin(i);
    values(i, 2) = y(localmin(i));
end

for i = length(localmin) + 1 : length(localmax) + length(localmin)
    values(i, 1) = localmax(i - length(localmin));
    values(i, 2) = y(localmax(i - length(localmin)));
end


figure;
plot(x, y(x))
hold on
plot(values( :, 1), values( : , 2), 'r+')

figure;
A = (1-cos(2*pi*0.01*x)).*sin(2*pi*0.15*x);
TF = islocalmax([-Inf, A, -Inf]);
TF = TF(2:end);
plot(x,A,x(TF),A(TF),'r*')

figure;
TF1 = islocalmin([Inf, A, Inf]);
TF1 = TF1(2:end);
plot(x,A,x(TF1),A(TF1),'r*')
