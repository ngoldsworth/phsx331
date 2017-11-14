function HW11_2(min)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  N. Goldsworth
% Date:    2017-11-13
% Class:   PHSX 331
% Purpose: This program plots the sinusodials solution to the one-dimensional
%          Scrodinger equation for the PIB for various values of k as described in HW11.
% Usage:  Input is the value for the minimum/lower n. The program adds 9 to
%         this minimum value so that there are 10 values of k plotted. The
%         input 'min' will be signified on the plot at n_1, n=min+1 will be
%         n_2, n=min+2 will be n+3, and so on.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constants
  L = 1.00e-10  ;        % meters, as defined in problem
  A = sqrt(2/L) ;        % Arbitrary constant for wavefunction, defined for consistency
                         % with solution discussed in class.

% Create array of n-values and x-values
  n = min:1:min+9 ;      % create array of n-values to use for plot
  x = 0:L/100:L   ;      % units of meters, create array for easy plotting

% Define k as dependent on n
  k = 2*pi/L * (n/10);  % wavenumber, units inverse meters, dependent on n
  
  figure()
  hold on
% Wavefunction Calculations
for i=1:length(n)
    wav=A*sin(k(i)*x);
    plot(x,wav)
end
xL = xlim;
yL = ylim;
line([0 0], yL);  %x-axis
line(xL, [0 0]);  %y-axis
legend('n=n_1','n_2','n_3','n_4','n_5','n_6','n_7','n_8','n_9','n_{10}')
xlabel('$$x$$ (m)','interpreter','latex')
ylabel('$$\Psi(kx)$$ (m$$^{-1/2}$$)','interpreter','latex')
title('$$x$$ vs $$\Psi(kx)$$ where $$k=\frac{2\pi n}{10}$$, starting with $n_1=5$','interpreter','latex')

end

