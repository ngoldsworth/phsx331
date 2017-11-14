function f = PIB_pert( w, x )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  C. Riedel
% Date:    2006-11-16
% Class:   Phys 331
% Purpose: This function will evaluate the functions describing the 
%          eigenmode of the particle in a 1D quantum-mechanical box
%          with a rectangular bump.
% Usage:   w(1) is the function describing the mode (arbitrary units)
%          w(2) is the derivative of w(1) (arbitrary units)
%          w(3) is the eigen-wave-number (m^{-1})
%          x is the distance from the left side of the box (m)
%            It IS used in the eigenvalue equation.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% f1 = dw(1)/dx
%

f1 = w(2);

%
% Implement the bump between a and b in the 
% the eigenvalue equation: f2 = dw(2)/dx 
%

%alpha = 2E10;  % sqrt(2mU_o/hbar^2), where U_o is the height of the bump
alpha = 6E10;  % sqrt(2mU_o/hbar^2), where U_o is the height of the bump
L = 1E-10;    % the width of the box (m)
a = L/3;      % left side of the bump (m)
b = 2*L/3;    % the right side of the bump (m)

if ( (x < a) || (x > b ) )  % outside of the bump region
  f2 = -w(3)^2 * w(1);  
else                        % inside the bump region
  f2 = -( w(3)^2 - alpha^2 ) * w(1);
end

%
% f3 = dw(3)/dx: never change the eigenvalue --- trick!
%

f3 = 0;

%
% form the array out of the f components
%

f = [ f1, f2, f3 ];
