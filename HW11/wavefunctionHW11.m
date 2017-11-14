function psi = wavefunctionHW11( x, n)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  N. Goldsworth
% Date:    2017-11-13
% Class:   PHSX 331
% Purpose: This program is the sinusodial solution to the one-dimensional
%          Scrodinger equation for the PIB as described in HW11.
% Usage:   Input is position x in meters, such that 0<x<L where L is an 
%          arbitrary for the box.
%          Output is the value of the wavefunction (in meters^-1/2) at
%          input x
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Constants
  L = 1.00e-10    % meters, as defined in problem
  A = sqrt(2/L)   % Arbitrary constant for wavefunction, defined for consistency
                  % with solution discussed in class.
  k = 2*pi*/L * (n/10)

% Wavefunction Calculation
psi = A*sin(k*x)   % in units of inverse root meters

end

