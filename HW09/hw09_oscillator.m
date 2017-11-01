function f = hw09_oscillator(y,t)
% Author:  N. Goldsworth
% Date:    2017-11-01
% Class:   Phys 331
% Purpose: This function will determine the acceleration of a
%          one-dimensional, damped, driven, harmonic oscillator
% Usage:   The input two-element array y contains y(1)=x (in meters)
%          and y(2) = dx/dt (in meters per second)
%          The input variable t time, and is present in the driving force.
%          Output is the aceleration, in meters per second per second

% Physical parameters
k =  1.00   ; % N/m
b =   .800  ; % kg*m/s
F_0 = .800  ; % N
f =  1.50   ; % Hz
m =  1.20   ; % kg
w = 2*pi*f  ; % for simplification, convert to radians
x0 =  .124  ; % meters, initial condition for position
v0 = 0      ; % meters/second, initial condition for velocity

% Let x' = dx/dt = dy(1)/dt = y(2) 
f1 = y(2);

% Let x'' =  -kx/m - bx'/m + F_0*cos(wt)/m
f2 = -(k/m)*x - (b/m)*f1 + (F_0)*(1/m)*cos(w*t);

% Now, form an arraw with f1 and f2
f = [ f1, f2 ];

end

