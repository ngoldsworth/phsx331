function plot_gs

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  C. Riedel
% Date:    2006-11-16
% Class:   Phys 331
% Purpose: This function will plot the first eigenfunction for the 
%          PIB problem.
% Usage:   All wave numbers are in units of inverse meters
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% set up the array of x values to plot
%

L = 1E-10;  % size of box in meters
nx = 100;  % number of array elements
dx = L/nx;
x = 0:dx:L;

%
% Find the first eigen-wave-number
% These values are chosen to allow changing U_o by factor of three
% without compromising bisect's search.
%

k1 = bisect( 'BC_PIB', 3.1E10, 3.2E10 );
k1_pert = bisect( 'BC_PIB_pert', 3.1E10, 6E10 );

%
% The eigenfunction, numerically obtained
%

w      = rk2( [ 0, 1, k1 ],      0, dx, nx, 'PIB' );
w_pert = rk2( [ 0, 1, k1_pert ], 0, dx, nx, 'PIB_pert' );

%
% The eigenfunction, analytically obtained
% for phi(0) = 0 and dphi/dx(0) = 1

k0 = pi/L;  % g.s. wave number
phi = sin( k0 * x ) / k0;  % g.s. eigenfunction 

%
% Now, make the plot
%

newplot;
%plot( x, w(:,1), '-b', x, phi, '-g' );
plot( x, w(:,1), '-b', x, w_pert(:,1), '-.r', x, phi, '-g' );
legend('pure PIB','PIB with bump','analytic',0); % position out of the way (0)
xlabel('x (m)');
ylabel('phi(x) (arbitrary units)');
title('Ground-state Wave Function for a Particle in an Atom-sized Box');
