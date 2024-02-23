%RK-4
func = @(x,y) sqrt(x+y);

initial_x = 0.4;
initial_y = 0.41;
final_x = 0.8;
h = 0.2;

steps = (final_x-initial_x)/h;

for i =1:steps
    K1 = h*func(initial_x, initial_y);
    K2 = h*func(initial_x + h/2, initial_y + K1/2);
    K3 = h*func(initial_x + h/2,initial_y + K2/2);
    K4 = h*func(initial_x + h,initial_y + K3);
    
    initial_y = initial_y + (1.0/6)*(K1+2*K2+2*K3+K4);
    initial_x = initial_x + h;
end
final_y = initial_y;
final_y
