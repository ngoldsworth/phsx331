function plotfit( xmin, xmax )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  C. Riedel
% Date:    2006-11-30
% Class:   Phys 331
% Purpose: This function will make a plot of data with error bars,
%          overlaid with a least-squares straight-line fit: y = a + bx.
% Usage:   xmin,xmax = minimum, maximum x value for the straight line
%          The function linfit.m accepts data of the form
%            x = independent variable array
%            y = dependent variable array
%            dy = array of uncertainties in dependent variable
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% Read the data to be fit, and validate input arrays
%

[x, y, dy] = textread( 'hw13.dat', '%f %f %f', 'headerlines', 5 );
npts = length( x );  % number of data points
if ( ( npts ~= length( y ) ) || ( npts ~= length( dy ) ) )
  display('Arrays must be of the same length')
  return
end

%
% Fit the data
%

fitpar_lin      = linfit(   x, y, dy );
fitpar_const    = constfit( x, y, dy );
fitpar_prop     = propfit(  x, y, dy );

%
% Determine the straight lines (for which we need only two points for each 
% function)
%
  % For linear fit
    xlinfit   = [ xmin, xmax ];
    ylinfit   = [ fitpar_lin(1) + fitpar_lin(3)*xmin, fitpar_lin(1) + fitpar_lin(3)*xmax ];
  % For constant fit
    xconstfit = [ xmin, xmax ];
    yconstfit = [ fitpar_const(1), fitpar_const(1) ];
  % For proportional fit
    xpropfit  = [ xmin, xmax ];
    ypropfit  = [ fitpar_prop(1)*xmin, fitpar_prop(1)*xmax ];

%
% Make the plot
%
figure()
hold off;
errorbar( x, y, dy, 'o' );
hold on;
    plot( xlinfit, ylinfit );
    plot( xconstfit, yconstfit);
    plot( xpropfit, ypropfit);


xlabel('x','interpreter','latex');
ylabel('y','interpreter','latex');
    leg1 = legend('Data Points', 'Linear, $$f(x)=a+bx$$' , 'Constant $$g(x)=c$$', 'Proportional $$h(x)=dx$$')
    set(leg1, 'interpreter', 'latex')
title('$$x$$ vs $$y$$','interpreter','latex');
%{
    sa = num2str(fitpar_lin(1),3);
    sb = num2str(fitpar_lin(3),3);
    schi2_nu = num2str(fitpar_lin(5),3);
    blah = strcat('a = ',sa,'^oC   b = ',sb,'^oC/cm  {\chi}^2_{red} = ',schi2_nu);
    legend(blah,0);
%}

