%Nystrom method with  a given step size, init value taken by trapezoidal
%method.
%requires step size, function, initial value, final value

step = 0.1;
Exact  = 4*(exp(2) - exp(1)); 
Errors = [];
Steps = [];
val = NystromMethod(0.1,1,2,0);
for h = 1:5
    Errors(end + 1) =abs(NystromMethod(step,1,2,0)- Exact);    
    Steps(end + 1) = step;
    step = step/2;     
end 
plot(Steps, Errors) %plot function ain't working!!
hold on;
function fin_y = NystromMethod(step_size, init_x, fin_x, init_y)
    steps = (fin_x- init_x)/step_size;
    y = zeros(1,steps+1);
    x = init_x:step_size:fin_x;
    y(1) = init_y;
    %finding y(2)
    y(2) = fzero(@(y_new) y_new - y(1) - step_size*(derv(y_new, x(2))), y(1));
       
    for i = 3:steps+1
        y(i) = fzero(@(y_new) y_new - y(i-2) - 2*(step_size)*(derv(y(i-1), x(i-1))), y(i-1));
    end
    fin_y = y(steps+1);
end

function val = derv(y, x)
    val = 2*y/x + x^2 *exp(x);
end