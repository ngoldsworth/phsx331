function plot_positionHW09(dt, N)

% Author:  N. Goldsworth
% Date:    2017-11-01
% Class:   Phys 331
% Purpose: This function will evaluate the displacement as a function of 
%          time for the damped, driven oscillator problem and plot the result.
% Usage:   The function hw09_oscillator.m must have as 
%          inputs: ( [x(m), x'(m/s)], t(s) ) and 
%          outputs: [ f1(m/s), f2(m/s^2) ], each a function of time
%          Input parameters for the integration
%          dt = time step (s)
%          N = number of time steps

% Some physical parameters from Hw09 problem
k =  1.00   ; % N/m
b =   .800  ; % kg*m/s
F_0 = .800  ; % N
f =  1.50   ; % Hz, frequency given in HW09 problem
f_r = .14528; % Hz, resonant frequency for the oscillator
m =  1.20   ; % kg
w = 2*pi*f  ; % for simplification, convert to radians
x0 =  .124  ; % meters, initial condition for position
v0 = 0      ; % meters/second, initial condition for velocity


%
% Initial conditions: the mass is released from rest
%
t0 = 0;                         % start the clock (s)
x0 = .124;                      % initial displacement (m) from equilibrium
xp0 = 0;                        % initially any speed (m/s)

%
% Do the integration
%
y = rk2( [ x0, xp0 ], t0, dt, N, 'hw09_oscillator.m')

%
% Make the arrays to plot
%
t = t0: dt: t0+N*dt;    % make an array of times (s)
position = y(:,1);        % evaluate the position with all forces acting on it

% the position for the simple harmonic oscillator (b = F_0 = 0)
position_sho = x0*cos(w*t);
velocity_sho = -v0*w*sin(w*t);

%
% Now, make the plot
%
newplot
plot(t,position,'-b',t,height_nodrag,'-.r')
grid on
legend('with drag','without drag')
xlabel('time (s)')
ylabel('distance from ground (m)')
title('Sky Diver Stepping out of a Stationary Balloon at 10,000 ft')
axis([t0 t0+N*dt 0 x0*1.1])