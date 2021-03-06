function plot_positionHW09(dt, N)

% Author:  N. Goldsworth
% Date:    2017-11-01
% Class:   Phys 331
% Purpose: This function will evaluate the displacement as a function of 
%          time for the damped, driven oscillator problem, the simple harmonic 
%          oscillator, and the dample, driven oscillator at resonant frequency 
%          and plot the result.
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
% Initial conditions: the mass is released from rest
%
t0 = 0;                         % start the clock (s)
x0 = .124;                      % initial displacement (m) from equilibrium
xp0 = 0;                        % initially any speed (m/s)

%
% Do the integration for the non-resonant case of the damped, driven
% oscillator
y = rk2( [ x0, xp0 ], t0, dt, N, 'hw09_oscillator')

%
% Do the integration for the resonant case of the damped, driven oscillator
% that is driven at the resonant frequency
y_r = rk2( [ x0, xp0 ], t0, dt, N, 'hw09_resonant_oscillator')

%
% Make the arrays to plot
%
t = t0: dt: t0+N*dt;    % make an array of times (s)
position          = y(:,1);  % evaluate the position with all forces acting on it
position_resonant = y_r(:,1);  % evaluate position with resonant driving force

% the position for the simple harmonic oscillator (b = F_0 = 0)
position_sho = x0*cos(w_sho*t);


%
% Now, make the plot
%
newplot
plot(t,position,'b',t,position_sho,'r',t,position_resonant,'m')
grid on
legend('Damped, Driven','Simple Harmonic','Resonant Freq on Damped, Driven')
xlabel('time (s)')
ylabel('Displacement (meters)')
title('Position of Various Harmonic Oscillators as Function of Time')
