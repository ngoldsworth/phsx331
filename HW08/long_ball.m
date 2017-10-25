function d = long_ball( v0, theta0 )

% return the distance traveled by a baseball with initial 
% velocity v0 and angle theta0 from horizontal (in degrees)

th_rad = theta0/57.2958;  % translate angle to radians
dt = 0.01;                % time step for integration

% the initial conditions
w0 = [ 0, 0, v0*cos(th_rad), v0*sin(th_rad) ];
t = 0.0;

% define a "flag" to indicate when program is done
done = 0;  % program is not done...  yet

% repeat until calculation is done
while done == 0
  w = rk2( w0, t, dt, 1, 'baseball' );  % take 1 step
  w0 = w(2,:);        % replace old data with new data
  t = t + dt;         % update time

  % check to see if calculation is done
  if w(2,2) < 0.0
    done = 1;  % ball has passed ground... end
  end

  if t > 30.0
    done = -1;   % safety precaution... end after 30 seconds
  end
end

if done == 1
% ball passed the ground in the last step
  x0 = w(1,1);  % point before ground...
  y0 = w(1,2);  % ... should be positive

  x1 = w(2,1);  % point after ground...
  y1 = w(2,2);  % ... should be negative

  % linear interpolation to the point of contact...
  frac = y0 / (y0 - y1);      % the fraction of the last time step
  d = x0*frac + x1*(1-frac);  % distance up to impact
else
  d = -1;    % indication that problem occurred
end
