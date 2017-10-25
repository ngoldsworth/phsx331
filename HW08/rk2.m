function y = rk2( y0, t0, dt, n_steps, deriv_func )

% take n_steps time steps, of size dt, in the differential equation
%    dy/dt = deriv_func( y, t )
% beginning with y(1) = y0 and time t = t0.
% all quantities y and f are of dimension m.

m = length( y0 );           % determine dimension from y0

y = zeros( n_steps+1, m );  % create an empty array for results

y( 1, : ) = y0;  % initial condition

for n = 1: n_steps

% the first half-step
  t = t0 + dt*(n-1);
  f = feval( deriv_func, y(n,:), t );
  y_star = y(n,:) + 0.5*dt*f;

% the full step
  t_star = t + 0.5*dt;
  f_star = feval( deriv_func, y_star, t_star );
  y(n+1,:) = y(n,:) + dt*f_star;

end
