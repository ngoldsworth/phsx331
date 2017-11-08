function f = satellite( w, t )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  N. Goldsworth
% Date:    2017-11-8
% Class:   Phys 331
% Purpose: This function will evaluate the RHS of the equation 
%          for an object passing by another object in space and feeling the
%          gravitational pull.
%          d^2x/dt^2 = -GMx/r^3
%          is the x-component of the satellite's acceleration due to the gravity
%          of the planet (m/s^2)
%          
%          d^2y/dt^2 = -gMy/r^3
%          is the y-component of the satellite's acceleration due to the gravity
%          of the planet (m/s^2)
% Usage:   The four-element input array w contains 
%          w(1)=x (m), w(2)=y (m), w(3)=dx/dt (m/s), and w(4)=dy/dt (m/s).
%          The four-element output array f contains 
%          f(1)=dx/dt, f(2)=dy/dt, f(3)=d^2x/dt^2, and f(4)=d^2y/dt^2.
%          The input variable t is not explicitly used since 
%          the ODE does not contain t explicitly.
%
% Note:    This program assumes that the earth is at the origin of
%          the xy-plane
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Physical Parameters
   G = 6.67408e-11     ;   % m^3 kg^-1 s^-2  ; Gravitational Constant
   M = 5.972e24        ;   % kg ; mass of the earth
   R = 6.371008e6      ;   % meters, radius of the earth
   
% Creating useful vectors
   r = [w(1) w(2)];
   v = [w(3) w(4)]
   
%
% Now, form the array of derivatives
%

f1 = w(3);                      % dx/dt = dw(1)/dt = w(3)
f2 = w(4);                      % dy/dt = dw(2)/dt = w(4)

speed = norm(v);                % satellite's speed

f3 = -GMx/(norm(r))^3;          %d^2x/dt^2 = -GMx/r^3
f4 = -GMy/(norm(r))^3;          %d^2y/dt^2 = -gMy/r^3

f = [ f1, f2, f3, f4 ];
