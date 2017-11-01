function plot_velocityHW09(dt, N)

% Author:  N. Goldsworth
% Date:    2017-11-01
% Class:   Phys 331
% Purpose: This function will evaluate and plot the veloticty as a function of 
%          time for the damped, driven oscillator, the simple harmonic
%          oscillator, and the damped, driven oscillator at resonance.
% Usage:   The function hw09_oscillator.m and hw09_resonant_oscillator.m must have as 
%          inputs: ( [x(m), x'(m/s)], t(s) ) and 
%          outputs: [ f1(m/s), f2(m/s^2) ], each a function of time
%          Input parameters for the integration
%          dt = time step (s)
%          N = number of time steps

% Some physical parameters from Hw09 problem
m =  1.20   ; % kg, mass of the object undergoinf harmonic motion
k =  1.00   ; % N/m, spring constant
b =   .800  ; % kg*m/s, mechanical impedance of damping force
F_0 = .800  ; % N, driving force coefficient
f =  1.50   ; % Hz, frequency given in HW09 problem
w = 2*pi*f  ; % for simplification, convert to radians per second
f_r = .14528; % Hz, resonant frequency for the damped, driven oscillator
w_r=2*pi*f_r; % resonant frequency, convert to radians per second
w_sho=sqrt(k/m);% radians per second, for the Simple Harmonic case
x0 =  .124  ; % meters, initial condition for position
v0 = 0      ; % meters/second, initial condition for velocity

%
% Initial conditions: the sky-diver steps out of a stationary balloon
%
t0 = 0;                         % start the clock (s)
x0 = .124;                      % initial displacement (m) from equilibrium
xp0 = 0;                        % initially any speed (m/s)
v0 = 0                      

%
% Do the integration for the non-resonant set-up
y = rk2( [ x0, xp0 ], t0, dt, N, 'hw09_oscillator');
% And now for the resonant set-up
y_r = rk2( [ x0, xp0 ], t0, dt, N, 'hw09_resonant_oscillator');


%
% Make the arrays to plot
%
t = t0: dt: t0+N*dt;          % make an array of times (s)
velocity =            y(:,2); % evaluate the velocity of oscillator with all forces acting on it
velocity_resonant = y_r(:,2); % evaluate the velovity of simple harmonic oscillator

% The velocity of the simple harmonic oscillator
velocity_sho = -x0*w_sho*sin(w_sho*t);

%
% Now, make the plot
%
newplot
plot(t,velocity,'b',t,velocity_sho,'r',t,velocity_resonant,'m')
grid on
legend('Damped, Driven','Simple Harmonic','Resonant Freq on Damped, Driven')
xlabel('time (s)')
ylabel('Velocity (meters/second)')
title('Velocity of Various Harmonic Oscillators as Function of Time')
