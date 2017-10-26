function plot_height(dt, N)

% Author:  C. Riedel
% Date:    2006-10-26
% Class:   Phys 331
% Purpose: This function will evaluate the height as a function of 
%          time for the sky-diver problem and plot the result.
% Usage:   The function sky_diver_bis.m must have as 
%          inputs: ( [z(m), z'(m/s)], t(s) ) and 
%          outputs: [ f1(m/s), f2(m/s^2) ], each a function of time
%          Input parameters for the integration
%          dt = time step (s)
%          N = number of time steps

%
% Initial conditions: the sky-diver steps out of a stationary balloon
%
t0 = 0;                         % start the clock (s)
z0 = 1.0E4 * 12 * 2.54 * 0.01;  % initially at 10,000 ft height (m)
zp0 = 0;                        % initially without vertical speed (m/s)

%
% Do the integration
%
y = rk2( [ z0, zp0 ], t0, dt, N, 'sky_diver_bis');

%
% Make the arrays to plot
%
t = t0: dt: t0+N*dt;        % make an array of times (s)
height = y(:,1);        % evaluate the height including drag (m)
g = 9.80665;            % acceleration of gravity (m/s^2)
% z(t) = z0 + v_z0*t - 0.5*g*t^2 (without drag, m)
height_nodrag = z0 + zp0*t - 0.5*g*t.*t; 

%
% Now, make the plot
%
newplot
plot(t,height,'-b',t,height_nodrag,'-.r')
grid on
legend('with drag','without drag')
xlabel('time (s)')
ylabel('distance from ground (m)')
title('Sky Diver Stepping out of a Stationary Balloon at 10,000 ft')
axis([t0 t0+N*dt 0 z0*1.1])