function y_D = legendre_D( l )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author:   Nelson Goldsworth
% Date:     3 Dec 2017
% Purpose:  Use to solve an IVP, with initial conditions defined herein.
% Usage:    Will be used as an inoput in a plotting function. Input is l,
%           the eigen-value of the equation that will be determined by
%           plotting.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This function was built from the BC_caseI function from the
% lecture/textbook.
%
% The purpose of this function is to set up boundary conditions.


L = 1.999998;       % length of domain

n_steps = 1000;     % number of steps to be used
dx = L/n_steps;     % step size from domain length and number of desired steps

% set initial conditions: w_1(-1) = y(?1)  =   1
%                         w_2(-1) = y'(?1) = ?21
%                         w_3(0)  = l
w0 = [ 1, -21, l ];

w = rk4( w0, -.999999, dx, n_steps, 'legendre' );  % solve ODE

y_D = w(n_steps+1, 1) -1;  % set output as 2*1 matrix, grabbing the last value
                           % from the array created by RK4
