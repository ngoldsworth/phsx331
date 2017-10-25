function f = pendulum( y, t )

% return the RHS of the equation for a damped pendulum
%    theta'' = -nu theta' - (g/L)*sin(theta)

g = 9.8;     % acceleration of gravity (m/s^2)
L = 9.8;     % length of pendulum (m)
nu = 0.1;    % damping coefficient (1/s)

f1 = y(2);   % d y_1 / dt = y_2
f2 = -nu*y(2) - (g/L)*sin( y(1) );

f = [ f1, f2 ];  % cast result as a vector
