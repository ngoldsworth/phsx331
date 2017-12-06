function f = legendre( w, x )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author:   Nelson Goldsworth
% Date:     3 Dec 2017
% Purpose:  This funtion will be used with RK4 to solve the Legendre
%           equation.
% Usage:    Input a vector w with w(1)=y, w(2)=y', w(3)=l.
%           Initial values are defined in another function (legendre_A,
%           legendre_B,...) and passed into this function via RK4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



f1 = w(2);
f2 = ( 2*x*w(2) - w(3)*( w(3)+1)*w(1) )/(1-x^2); 
f3 = 0;   % never change the eigenvalue --- trick!

f = [ f1, f2, f3 ];
