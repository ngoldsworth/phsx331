function f = sky_diver_bis( y, t )

% Author:  C. Riedel
% Date:    2006-10-26
% Class:   Phys 331
% Purpose: This function will evaluate the RHS of the equation 
%          for a falling sky-diver subject to a drag force:
%          z'' = -g - alpha * z'*|z'|
%          z'' is the upward acceleration (m/s^2) of the sky-diver
%              at time t (s) with a upward speed z' (m/s).
% Usage:   The input two-element array y contains y(1)=z (m) and 
%          y(2)=dz/dt (m/s).
%          The input variable t is not explicitly used since 
%          the ODE does not contain t explicitly.
% terminal_speed = sqrt(g/alpha) = 40.428 m/s

% The physical parameters
g = 9.80665;   % acceleration of gravity (m/s^2)
rho = 1.2;     % mass density of air (kg/m^3)
A = 1.0;       % cross-sectional area of sky-diver (m^2)
C_d = 1.0;     % coefficient of drag
%C_d = 0.0;     % coefficient of drag
m = 100.0;     % mass of diver (kg)

alpha = 0.5 * rho * A * C_d / m; % proportionality constant v^2-->a (m^-1)

% Let z' = dz/dt = dy(1)/dt = y(2)
f1 = y(2);

% Let z'' = -g - alpha * z'*|z'|
f2 = - g - alpha * y(2) * abs(y(2));

% Now, form an array with f1 and f2
f = [ f1, f2 ];
