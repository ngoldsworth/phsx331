function y_A = legendre_A( l )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author:   Nelson Goldsworth
% Date:     3 Dec 2017
% Purpose:  Use to solve an IVP 
% Usage:    Willbe used as an inoput in a plotting function. Input is l.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This function was built from the BC_caseI function from the
% lecture/textbook.
%
% The purpose of this function is to set up boundary conditions. 


L = 1.999998;       % length of domain

n_steps = 1000;     % number of steps to be used
dx = L/n_steps;

% set initial conditions: w_1(-1) = y(-1)  = 1
%                         w_2(-1) = y'(-1) = 0
%                         w_3(0)  = l
w0 = [ 1, 0, l ];

w = rk4( w0, -.999999, dx, n_steps, 'legendre' );  % solve ODE

y_A = w(n_steps+1, 1) -1; 
