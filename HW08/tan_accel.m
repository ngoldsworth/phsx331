function f = tan_accel( r, s )

% Author:  C. Riedel
% Date:    2006-10-19
% Class:   Phys 331
% Purpose: This function will evaluate the tangent to the total 
%          gravitational acceleration due to both the Sun and the 
%          Earth, at the field point r.
% Usage:   The input field point r (in m) is a vector of positions in x-y
%          coordinates with respect to the Sun at [0,0], where the 
%          position of the Earth defines the +x axis.  
%          The input variable s is not used, but present for consistency 
%          with textbook version of rk2.m.
%          The output is unitless.
% 

a = efield_dir( r );    % evaluate components of the gravitational field (m/s^2)
amag = norm( a );    % |a| (m/s^2)

f = a/amag;          % the tangent vector (dimensionless)
