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
  dk  = (kup-klow)/100; % Step size for k-array

% Create array of k-values
  %k = klow:dk:kup;     % units of inverse meters, k is a wavenumber
  k=0:pi/(10*L):10*pi/L;
  
% Set up plot/figure
  figure()
  hold on
  
% Wavefunction calculations, plot using arrays
    for i=1:length(k)
      wav=A*sin(k(i)*L);
      plot(k,wav)
    end

% Figure stuff
    %xL = xlim;
    %yL = ylim;
    %line([0 0], yL);  %x-axis
    %line(xL, [0 0]);  %y-axis
    legend()
    xlabel('$$k$$ (inverse meters)','interpreter','latex')
    ylabel('$$\psi(kL)$$','interpreter','latex')
    title('$$k$$ vs $$\psi(kL)$$ for continuous $$k$$','interpreter','latex')
end

