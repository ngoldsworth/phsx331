function speed = speed_at_impact( plane_height, plane_speed )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  C. Riedel
% Date:    2006-11-02
% Class:   Phys 331
% Purpose: This function will evaluate the speed (m/s) for the sky-diver 
%          problem at the instant of impact with Earth.
% Usage:   The function sky_diver_bis2.m must have as 
%            inputs: ( [x(m), z(m), dx/dt(m/s), dz/dt(m/s)], t(s) ) and 
%            outputs: [ v_x(m/s), v_z(m/s), a_x(m/s^2), a_z(m/s^2) ], 
%            each a function of time
%          Input parameters 
%            plane_height = altitude of plane when sky-diver exits it (m)
%            plane_speed = speed of plane when sky-diver exits it (m/s)
%          The plane is assumed to be traveling horizontally, i.e.,
%            in the +x direction.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% Initial conditions: the sky-diver steps out of the plane
%

t0 = 0;     % start the clock (s)
x0 = 0;     % initial horizontal location (m)
zp0 = 0;    % initially without vertical speed (m/s)
w0 = [ x0, plane_height, plane_speed, zp0 ];

%
% Specify integration parameters
%

dt = 0.1;      % time step (s)
N = 1;         % number of steps, one step at a time
maxt = 10000;  % safety flag -- end calculation after maxt (s)

%
% Do the integration until we have arrived
%

done = 0;  % initialize a flag to indicate when the calculation is done

while ( done == 0 )

  w = rk2( w0, t0, dt, N, 'sky_diver_bis2');
  w0 = w(2,:)   % replace old data with new data
  t0 = t0 + dt;  % update time

  % check to see if calculation is done or we should stop it
  if ( w(2,2) < 0 )
    done = 1;  % sky-diver has "landed"
  elseif ( t0 > maxt )
    done = -1; % safety precaution ... end after a too-long interval
  end
  % otherwise, we leave the done flag at zero, and loop again

end

%
% So now, the integration is completed
%

if ( done == 1 ) % sky-diver passed the ground in the last step

  % just before impact
%  x_before  = w(1,1); % (m)
  z_before  = w(1,2); % (m)
  vx_before = w(1,3); % (m/s)
  vz_before = w(1,4); % (m/s)

  % just after impact (if Earth were not in the way)
%  x_after   = w(2,1); % (m)
  z_after   = w(2,2); % (m)
  vx_after  = w(2,3); % (m/s)
  vz_after  = w(2,4); % (m/s)

  % linear interpolation to the point of contact...
  %   (is backwards in text)
  frac = z_before / (z_before - z_after);    % fraction of the last time step
  vx0 = vx_before*(1-frac) + vx_after*frac;  % x velocity (m/s) up to impact
  vz0 = vz_before*(1-frac) + vz_after*frac;  % z velocity (m/s) up to impact
  speed = sqrt( vx0^2 + vz0^2 );             % speed (m/s) up to impact

else

  speed = -1;  % indication that a problem occurred

end

