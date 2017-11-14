function f = PIB( w, x )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  C. Riedel
% Date:    2006-11-16
% Class:   Phys 331
% Purpose: This function will evaluate the functions describing the 
%          eigenmode of the particle in a 1D quantum-mechanical box.
% Usage:   w(1) is the function describing the mode (arbitrary units)
%          w(2) is the derivative of w(1) (arbitrary units)
%          w(3) is the eigen-wave-number (m^-1)
%          x is the distance from the left side of the box (m)
%            It is not used explicitly in the eigenvalue equation, 
%              but it must be present in the input list for RK2
%              implementation.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f1 = w(2);            % dw(1)/dx
f2 = -w(3)^2 * w(1);  % dw(2)/dx the eigenvalue equation
f3 = 0;               % dw(3)/dx: never change the eigenvalue --- trick!

f = [ f1, f2, f3 ];
