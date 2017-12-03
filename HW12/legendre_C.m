function y_C = legendre_C( l )
% This function is cas built from the BC_caseI function from the
% lecture/textbook.


L = 1.999998;       % length of domain

n_steps = 1000;     % number of steps to be used
dx = L/n_steps;

% set initial conditions: w_1(-1) = y(?1)  =  1
%                         w_2(-1) = y'(?1) = ?3
%                         w_3(0)  = l
w0 = [ 1, -3, l ];

w = rk2( w0, -.999999, dx, n_steps, 'legendre' );  % solve ODE

y_C = w(n_steps+1, 1) -1; 