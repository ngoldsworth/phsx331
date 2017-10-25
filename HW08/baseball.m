function f = baseball( w, t )

% return the acceleration on a baseball
%  w(1) = x,  w(2) = y,  w(3) = v_x,  w(4) = v_y

g = 9.8;    % acceleration of gravity (m/s^2)
rho = 1.2;  % mass density of air (kg/m^3)
a = 4.16e-3; % cross sectional area of baseball (m^2)
             % baseball circumference = 9" = 0.2286 m
             %    ==> r = 0.0364 m
C_d = 0.5;   % coefficient of drag
M = 0.142;   % mass of baseball (kg) ( 5 oz. )

alpha = 0.5*rho*a*C_d/M;
v = sqrt( w(3)^2 + w(4)^2 );  % |v|

f = [ w(3), w(4), -alpha*v*w(3), -g-alpha*v*w(4) ];
