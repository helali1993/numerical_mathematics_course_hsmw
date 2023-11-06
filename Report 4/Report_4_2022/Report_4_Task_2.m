

x = 0:5:1000;
 
U = [x.*(1-x);x.*(1-x)];

h = 1;
c = 2;
dt = 1;

for m = 2:1000
    for i = 2:size(U, 2) - 1
        U(m+1, i) = (-c/(h^2))*(2*U(m,i) - U(m, i+1) - U(m, i-1))*dt^2 + 2*U(m, i) - U(m-1, i);
    end
end

movegui(figure,'northwest')    
        for n=1:5:size(U,1)
            plot(x,U(n,:))
            axis([min(x) max(x) -10000000 10000000])
            title(['t=' num2str(n)])
            F = getframe(1);    %captures the figure as movie frame
            RGB = frame2im(F);  %turns frame into image
        end

