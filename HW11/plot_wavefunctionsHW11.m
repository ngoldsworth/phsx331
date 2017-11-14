function plot_wavefunctionsHW11()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  N. Goldsworth
% Date:    2017-11-13
% Class:   PHSX 331
% Purpose: This program plots the sinusodials solution to the one-dimensional
%          Scrodinger equation for the PIB for various values of k as described in HW11.
% Usage:  
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constants
  L = 1.00e-10  ;        % meters, as defined in problem
  A = sqrt(2/L) ;        % Arbitrary constant for wavefunction, defined for consistency
                         % with solution discussed in class.

% Create array of nvalues and x-values
  n = 1:1:10    ;
  x = 0:L/100:L ;

% Define k as dependent on n
  k = 2*pi/L * (n/10);  % wavenumber, units inverse meters
  
  figure()
  hold on
% Wavefunction Calculations and Plot
for i=1:length(n)
    wav=A*sin(k(i)*x);
    plot(x,wav,'-')
end

% Make plot look nice

    %These 4 lines draw axes
    xL = xlim;
    yL = ylim;
    line([0 0], yL);  %x-axis
    line(xL, [0 0]);  %y-axis
    
legend('n=1','2','3','4','5','6','7','8','9','10')
xlabel('$$x$$ (m)','interpreter','latex')
ylabel('$$\Psi(kx)$$ (m$$^{-1/2}$$)','interpreter','latex')
title('$$x$$ vs $$\Psi(kx)$$ where $$k=\frac{2\pi n}{10}$$','interpreter','latex')

end

