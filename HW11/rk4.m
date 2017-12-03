function y = rk4( y0, t0, dt, n_steps, deriv_func )

% take n_steps time steps, of size dt, in the differential equation
%    dy/dt = deriv_func( y, t )
% beginning with y(1) = y0 and time t = t0.
% all quantities y and f are of dimension m.

m = length( y0 );           % determine dimension from y0

y = zeros( n_steps+1, m );  % create an empty array for results

y( 1, : ) = y0;  % initial condition

for n = 1: n_steps

% setting up t     
  t = t0 + dt*(n-1);
  k1  = dt*feval( deriv_func, y(n,:), t );

% k2 is function of t_a, y_a  
  y_a = y(n,:) + 0.5*k1;
  t_a = t + 0.5*dt;
  k2  = dt*feval( deriv_func, y_a, t_a );

% k3 is function of t_b, y_b  
  y_b = y(n,:) + 0.5*k2;
  t_b = t + 0.5*dt;
  k3  = dt*feval( deriv_func, y_b, t_b );
  
% k4 is function of t_c, y_c    
  y_c = y(n,:) + k3;
  t_c = t + dt;
  k4  = dt*feval( deriv_func, y_c, t_c );

% making final output array
  y(n+1,:) = y(n,:) + (k1+k4)/6 + (k2+k3)/3;

end

