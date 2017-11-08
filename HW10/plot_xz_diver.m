function plot_xz_diver( plane_height, plane_speed, dt, N)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  C. Riedel
% Date:    2006-11-02
% Class:   Phys 331
% Purpose: This function will plot the trajectory for the sky-diver 
%          problem as a function of time.
% Usage:   The function sky_diver_bis2.m must have as 
%            inputs: ( [x(m), z(m), dx/dt(m/s), dz/dt(m/s)], t(s) ) and 
%            outputs: [ v_x(m/s), v_z(m/s), a_x(m/s^2), a_z(m/s^2) ], 
%            each a function of time
%          Input parameters 
%            plane_height = altitude of plane when sky-diver exits it (m)
%            plane_speed = speed of plane when sky-diver exits it (m/s)
%            dt = time step (s)
%            N = number of steps
%          The plane is assumed to be traveling horizontally, i.e.,
%            in the +x direction.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% Initial conditions: the sky-diver steps out of the plane
%

t0 = 0;     % start the clock (s)
x0 = 0;     % initial horizontal location (m)
zp0 = 0;    % initially without vertical speed (m/s)
w0 = [ x0, plane_height, plane_speed, zp0 ];

%
% Perform integration
%

w = rk2( w0, t0, dt, N, 'sky_diver_bis2');

%
% Make the arrays to plot
%

range = w(:,1);         % evaluate the horizontal displacement (m)
height = w(:,2);        % evaluate the height (m)

%
% Now, make the plot
%

newplot;
plot(range,height);
xlabel('horizontal displacement (m)');
ylabel('height above ground (m)');
title('Sky Diver Stepping out of Airplane');
