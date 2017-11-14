function g = BC_caseI( omega )

% return the value of w_1(x) at x = L = 1 meter.

L = 1;  % length of domain

n_steps = 1000;  % number of steps to be used
dx = L/n_steps;

% set initial conditions: w_1(0) = phi(0) = 0
%                         w_2(0) = phi'(0) = 1
%                         w_3(0) = omega
w0 = [ 0.0, 1.0, omega ];

w = rk2( w0, 0.0, dx, n_steps, 'caseI' );  % solve ODE

g = w(n_steps+1, 1);  % w_1(L) = g
