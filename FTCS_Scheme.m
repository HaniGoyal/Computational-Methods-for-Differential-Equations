%FTCS Scheme

%boundary fnc 
boundary = @(x)(sin(2*pi*x)); 


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

%FTCS Scheme

for i = 2:length(t)
    for j = 2:length(x)-1
    U(j,i) = r*U(j-1,i-1) + (1-2*r)*U(j,i-1) + r*U(j+1,i-1); 
    end
end

disp(U);