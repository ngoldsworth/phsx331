function mindist = minimum_satellite_distance()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  C. Riedel
% Date:    2006-11-02
% Class:   Phys 331
% Purpose: This function will evaluate the smallest distance (m) between 
%          the sky-diver and the surface of the Earth for the 
%          sky-diver problem.
% Usage:   The function sky_diver_bis2.m must have as 
%            inputs: ( [x(m), z(m), dx/dt(m/s), dz/dt(m/s)], t(s) ) and 
%            outputs: [ v_x(m/s), v_z(m/s), a_x(m/s^2), a_z(m/s^2) ], 
%            each a function of time
%          Input parameters 
%            plane_height = altitude of plane when sky-diver exits it (m)
%            plane_speed = speed of plane when sky-diver exits it (m/s)
%          The plane is assumed to be traveling horizontally, i.e.,
%            in the +x direction.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% Initial conditions: the sky-diver steps out of the plane
%

t0  = 0;     % start the clock (s)
x0  = 0;     % x-coordinate of initial location (m)
y0  = 0;     % y-coordinate of initial location (m)
vx0 = 0;     % x-component of initial velocity (m/s)
vy0 = 0;     % y-component of initial velocity (m/s)
w0 = [ x0, y0, vx0, vy0 ];

% Variables for book-keeping

dist_0 = (x0^2 + y0^2)^(1/2);  % distance from satellite to Earth at t=0

%
% Specify integration parameters
%

dt = 0.01;      % time step (s)
N = 1;         % number of steps, one step at a time
maxt = 10000;  % safety flag -- end calculation after maxt (s)

%
% Do the integration until we have arrived
%

done = 0;  % initialize a flag to indicate when the calculation is done
mindist = dist_0; % initialize the minimum distance to something large

while ( done == 0 )

  w = rk2( w0, t0, dt, N, 'satellite');
  w0 = w(2,:)   % replace old data with new data
  t0 = t0 + dt;  % update time

  % check to see if calculation is done or we should stop it
  dist = abs( w(2,2) );  % calculate current distance to ground (m)
  if ( dist > mindist )
    done = 1;  % the minimum distance has been achieved
  elseif ( t0 > maxt )
    done = -1; % safety precaution ... end after a too-long interval
    mindist = - initial_distance; % set unphysical distance to indicate problem
  else
    mindist = dist  % reset the current minimum distance  
  end

end