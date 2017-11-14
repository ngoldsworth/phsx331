function psi_L()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  N. Goldsworth
%
% Date:    2017-11-14
%
% Class:   PHSX 331
%
% Purpose: This program makes a plot of ?(L) as a function of k for 0 < k <
%          10?/L, treating k as a continuous variable.
%
% Usage:   
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Constants
  L = 1.00e-10  ;        % meters, as defined in problem
  A = sqrt(2/L) ;        % Arbitrary constant for wavefunction, defined for consistency
                         % with solution discussed in class.
                         
% Bounds for k, and step size for array
  klow = 0;             % Lower bound for k
  kup  = 10*pi/L;       % Upper bound for k
  dk  = (kup-klow)/1000; % Step size for k-array

% Create array of k-values
  k = klow:dk:kup;     % units of inverse meters, k is a wavenumber
  
% Set up plot/figure
  figure()
  hold on
  
% Wavefunction calculations, plot using arrays
    wav=A*sin(k*L);
    plot(k,wav,'r')

% Figure stuff

        %These 4 lines draw axes
        xL = xlim;
        yL = ylim;
        line([0 0], yL);  %x-axis
        line(xL, [0 0]);  %y-axis
        
    xlabel('$$k$$ (m$$^{-1}$$)','interpreter','latex')
    ylabel('$$\psi(kL)$$ (m$$^{-1/2}$$)','interpreter','latex')
    title('$$k$$ vs $$\psi(kL)$$ for continuous $$k$$','interpreter','latex')
end

