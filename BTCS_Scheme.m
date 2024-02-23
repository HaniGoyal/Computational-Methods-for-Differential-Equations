%BTCS Scheme

%boundary fnc 
boundary = @(x)(sin(2*pi*x)); 

%parameters
mu = 1/6;
step_size = 0.1;
time_step = 0.06;
time = 0.9;
initial_x = 0;
final_x = 1;
steps = (final_x - initial_x)/step_size;
x = initial_x:step_size:final_x;
t = 0:time_step:time; 

r = (mu*time_step)/(step_size*step_size);


%initialization

U = zeros(length(x), length(t));
for i = 1:length(x)
    U(i, 1) = boundary(x(i));
end
U(1, :) = 0;
U(length(x), :) = 0;

%BTCS Scheme

A = full(gallery('tridiag', length(x)-2,-r,1+2*r,-r));
for i = 1:length(t)-1
    B = U(2:length(x)-1,i);
    U(2:length(x)-1,i+1) = A\B; 
end

disp(U);