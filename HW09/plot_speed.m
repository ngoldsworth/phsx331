function plot_speed(dt, N)

% Author:  C. Riedel
% Date:    2006-10-26
% Class:   Phys 331
% Purpose: This function will evaluate the speed as a function of 
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
speed = abs( y(:,2) );  % evaluate the descent speed with drag (m/s)
g = 9.80665;            % acceleration of gravity (m/s^2)
speed_nodrag = abs(zp0 - g*t);  % v_z(t) = v_z0 - g*t (without drag, m/s)

%
% Now, make the plot
%
newplot
plot(t,speed,'-b',t,speed_nodrag,'-.r')
grid on
legend('with drag','without drag')
xlabel('time (s)')
ylabel('vertical speed (m/s)')
title('Sky Diver Stepping out of a Stationary Balloon at 10,000 ft')
axis([ t0 t0+N*dt zp0 max(speed_nodrag)*1.1 ])
