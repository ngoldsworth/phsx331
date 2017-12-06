function fitpar_const = constfit()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  N. Goldsworth
% Date:    5 Dec 2017
% Class:   Phys 331
% Purpose: This function will make a least-squares fit to data with
%          a straight line y = c, using an algorithm based on 
%          Bevington.
% Usage:   x = independent variable array
%          y = dependent variable array
%          sigmay = array of uncertainties in dependent variable
%          Units on variables are determined by calling routine.
%          All three arrays must be of the same dimension.
%          The output array fitpar contains the fit parameters.
%          fitpar_const(1) = c (value of c, with same units as y)
%          fitpar_const(2) = reduced chi-squared (chi2red, unitless)
%
%   ** This function is a direct modification of the original linfit.m
%      function from the textbook
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% Read the data to be fit
%

[x, y, sigmay] = textread( 'hw13.dat', '%f %f %f', 'headerlines', 5 );

% Verify that all input arrays are the same length, 
% and that there is enough data
%

npts = length( x );  % number of data points
if ( ( npts ~= length( y ) ) || ( npts ~= length( sigmay ) ) )
  display('You idiot! Arrays must be of the same length. Learn to program!')
  return
end

npar = 2;  % number of fitting parameters
if ( npts < npar )
  display('Sorry, not enough data points to fit a first-order polynomial. A circuit shorted somewhere between the seat cushion and keyboard.')
  return
end

%
% Accumulate weighted sums
%

    w = sigmay.^(-2); % array containing weights
    sumw  = dot(w,ones(npts,1)); % sum over w(i) times 1
    sumx  = dot(w,x);            % sum over w(i) times x(i)
    sumy  = dot(w,y);            % sum over w(i) times y(i)
    sumx2 = dot(w,x.^2);         % sum over w(i) times x(i) squared
    sumxy = dot(w,x.*y);         % sum over w(i) times x(i) times y(i)

%
% Calculate fit parameters
%

    c = sumy/sumw;
    
    chi2 = dot( (y-c).^2,w );
    if (npts > npar)
        chi2red = chi2 / (npts - npar);
    else % npts = npar
        chi2red = 0;
    end
    
 fitpar_const = [ c, chi2red ]
  
end

