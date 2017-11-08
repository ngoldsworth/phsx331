function f = sky_diver_bis2( w, t )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  C. Riedel
% Date:    2006-11-2
% Class:   Phys 331
% Purpose: This function will evaluate the RHS of the equation 
%          for a falling sky-diver subject to a drag force:
%          d^2z/dt^2 = -g - alpha * v_z * v
%          d^2x/dt^2 = -alpha * v_x * v
%          d^2z/dt^2 is the upward acceleration (m/s^2) of the sky-diver
%              at time t (s) with a upward velocity dz/dt (m/s).
%          d^2x/dt^2 is the horizontal acceleration (m/s^2) of the sky-diver
%              at time t (s) with a horizonal velocity dx/dt (m/s).
% Usage:   The four-element input array w contains 
%          w(1)=x (m), w(2)=z (m), w(3)=dx/dt (m/s), and w(4)=dz/dt (m/s).
%          The four-element output array f contains 
%          f(1)=dx/dt, f(2)=dz/dt, f(3)=d^2x/dt^2, and f(4)=d^2z/dt^2.
%          The input variable t is not explicitly used since 
%          the ODE does not contain t explicitly.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% The physical parameters
%

g = 9.80665;   % acceleration of gravity (m/s^2)
rho = 1.2;     % mass density of air (kg/m^3)
A = 1.0;       % cross-sectional area of sky-diver (m^2)
C_d = 1.0;     % coefficient of drag
m = 100.0;     % mass of diver (kg)

alpha = 0.5 * rho * A * C_d / m; % proportionality constant for drag acceleration (m^{-1})

%
% Now, form the array of derivatives
%

f1 = w(3);                      % dx/dt = dw(1)/dt = w(3)
f2 = w(4);                      % dz/dt = dw(2)/dt = w(4)

speed = sqrt( w(3)^2 + w(4)^2 ); % diver speed (m/s)

f3 = - alpha * speed*w(3);      % d^2x/dt^2 = - alpha * v*v_x
f4 = - g - alpha * speed*w(4);  % d^2z/dt^2 = -g - alpha * v*v_z

f = [ f1, f2, f3, f4 ];
