function g = BC_PIB_pert( k )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  C. Riedel
% Date:    2006-11-16
% Class:   Phys 331
% Purpose: This function will evaluate the function describing the 
%          eigenmode of the particle in a 1D quantum-mechanical box
%          at the other boundary, i.e., x=L.
% Usage:   k is the wave number in inverse meters (m^{-1})
%          w(1) is the function describing the mode (arbitrary units)
%          w(2) is the derivative of w(1) (arbitrary units)
%          w(3) is k
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% The physical parameters and boundary conditions
%

L = 1E-10;     % size of the box (m), this is about the size of an atom
phi0 = 0.0;    % phi(0) = 0
phip0 = 1.0;   % dphi/dx(0) = 1
w0 = [ phi0, phip0, k ]; % the eigenvalue trick from PIB.m

%
% Define the integration parameters
%

n_steps = 1000;  % number of steps to be used
dx = L/n_steps;  % the step size (m)

%
% Do the integration all the way to the right side of the box
%

w = rk2( w0, 0.0, dx, n_steps, 'PIB_pert' );  % solve ODE

% 
% Extract the value of the wavefunction phi at x=L
%

g = w(n_steps+1, 1);  % w_1(L) = g
