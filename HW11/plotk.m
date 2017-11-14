function plotk

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  C. Riedel
% Date:    2006-11-16
% Class:   Phys 331
% Purpose: This function will plot the value of the eigenfunction at 
%          x=L for a range of k values for the PIB problem that solve 
%          the ODE.  Where the value of the eigenfunction is zero,
%          the value of k is an eigenvalue
% Usage:   k is the wave number in inverse meters (m^{-1}).
%          The units of g are arbitrary.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% set up the array of possible eigenvalues
%

dk = 1e9;
nk = 100;
k = 0:dk:nk*dk;

%
% Create function g(k) to find the zeroes 
% for both the pure PIB and for the "perturbed" PIB
%

g = zeros ( nk+1, 1 );
g_pert = zeros ( nk+1, 1 );
for i = 1: nk+1
  g(i) = BC_PIB( k(i) );
  g_pert(i) = BC_PIB_pert( k(i) );
end

%
% Now, make the plot
%

newplot;
%plot( k, g, '-b' );
plot( k, g, '-b', k, g_pert, '-.r' );
grid on
legend('pure PIB','PIB with bump',0); % position out of the way (0)
xlabel('wave number k (m^{-1})');
ylabel('phi(L) (arbitrary units)');
title('Shooting for the Particle in an Atom-sized Box');
