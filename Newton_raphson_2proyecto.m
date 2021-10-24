clc
%% x(1) --> x
%% x(2) --> y
x|F= @(x) [(5 + x(1) + x(2)) / (50 - 2 * x(1) - x(2)) ^ 2 / (20 - x(1)) - 0.0004;
     (5 + x(1) + x(2)) / (50 - 2 * x(1) - x(2)) / (10 - x(2)) - 0.037];
J= @(x) [
(8*x(1)^3+16*(x(1)^2)*x(2)-220*(x(1)^2)+8*x(1)*(x(2)^2)-520*x(1)*x(2)-2800*x(1)+(x(2)^3)+3600*x(2)+82500-155*(x(2)^2))/(((50-2*x(1)-x(2))^2))*(20-x(1)), (x(2)+60)/((20-x(1))*(50-2*x(1)-x(2))^3);
((-2*x(1)^2)-4*x(1)*x(2)-20*x(1)+55*x(2)+850-x(2)^2)/(((50-2*x(1)-x(2))^2)*(10-x(1))^2),(-x(1)+55)/((10-x(1))*(50-2*x(1)-x(2))^2)];
x = [3; 3];
error = 1e-2;
tol = 1e-5;
n = 0;
while error > tol
 dx = -J(x)\F(x);
 error = norm(dx)/norm(x);
 x = x + dx;
 n = n+1;
end
fprintf("Iteraciones : %d \n",n);
fprintf("Respuesta : %f \n", x.');