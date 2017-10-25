function accel = gravity(r)

% Author:  C. Riedel
% Date:    2006-10-19
% Class:   Phys 331
% Purpose: This function will evaluate the total gravitational 
%          acceleration due to both the Sun and the Earth, at 
%          the field point r.
% Usage:   The input field point (in m) is a vector of positions in x-y
%          coordinates with respect to the Sun at [0,0], where the 
%          position of the Earth defines the +x axis.  
%          The output is in units of m/s^2.

% The physical parameters
R_E = 149.6E9;           % Earth-Sun distance (m)
M_S = 1.98844E30;        % Sun mass (kg)
M_E = 5.9723E24;         % Earth mass (kg)
G = 6.6742E-11;          % universal gravitational constant (N-m^2/kg^2)
rad_Sun = 6.960E8;       % radius of the Sun (m)
rad_Earth = 6.378135E6;  % radius of Earth (m)

% Let the Sun define the origin, and the Earth position define the +x axis (m)
rs = [ 0.0, 0.0 ];
re = [ R_E, 0.0 ];
r_Sun   = rs - r;   % points from the field point to the Sun
r_Earth = re - r;   % points from the field point to the Earth

% Distance from field point to Sun and to Earth (m)
r_Sun_mag   = norm( r_Sun );
r_Earth_mag = norm( r_Earth );

% gravitational acceleration due to Sun (m/s^2)
if (r_Sun_mag <= rad_Sun) % field point is inside the Sun
  grav_Sun = G * M_S / rad_Sun^3 * r_Sun;
else
  grav_Sun = G * M_S * r_Sun / r_Sun_mag^3;
end

% gravitational acceleration due to Earth (m/s^2)
if (r_Earth_mag <= rad_Earth) % field point is inside the Earth
  grav_Earth = G * M_E / rad_Earth^3 * r_Earth;
else
  grav_Earth = G * M_E * r_Earth / r_Earth_mag^3;
end

accel = grav_Sun + grav_Earth;
