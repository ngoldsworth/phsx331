function f = hw09_resonant_oscillator(y,t)
% Author:  N. Goldsworth
% Date:    2017-11-01
% Class:   Phys 331
% Purpose: This function will determine the acceleration of a
%          one-dimensional, damped, driven, harmonic oscillator operating
%          at the resonant frequency of the system. For HW09, the resonant
%          frequency is .14528 Hz
% Usage:   The input two-element array y contains y(1)=x (in meters)
%          and y(2) = dx/dt (in meters per second)
%          The input variable t time, and is present in the driving force.
%          Output is the aceleration, in meters per second per second

% Physical parameters
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

% Let x' = dx/dt = dy(1)/dt = y(2) 
f1 = y(2);

% Let x'' =  -kx/m - bx'/m + F_0*cos(wt)/m
f2 = -(k/m)*y(1) - (b/m)*f1 + (F_0)*(1/m)*cos(w_r*t);

% Now, form an arraw with f1 and f2
f = [ f1, f2 ];

end

