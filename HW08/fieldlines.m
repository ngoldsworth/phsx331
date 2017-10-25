function fieldlines()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  C. Riedel
% Date:    2007-10-18
% Class:   Phys 331
% Purpose: This function will plot the gravitational field lines due to 
%          the Earth and the Sun.
% Usage:   The function rk2.m is as given in the class textbook.
%          The function tan_accel.m must evaluate the ratio of the 
%          graviational field to the magnitude of the field for a given 
%          location [x(m),y(m)] and s, the distance along the curve.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% Calculational and physical parameters
%
s0 = 0;                  % start at beginning of curve
ds = 10E8;               % step size
nsteps = 200;            % number of points in each field line
R_E = 149.6E9;           % Earth-Sun distance (m)
rad_Sun = 6.960E8;       % radius of the Sun (m)
rad_Earth = 6.378135E6;  % radius of Earth (m)

%
% Start with a clean slate
%
newplot
hold on

%
% Plot some lines starting near the Earth-Sun axis
%
ymin = -10*rad_Earth;
dy = rad_Earth;
ymax = 10*rad_Earth;

xmin = R_E - 10*rad_Earth;
dx = rad_Earth;
xmax = R_E + 10*rad_Earth;
for y = ymin: dy: ymax
  for x = xmin: dx: xmax
    r = rk2( [x,y], s0, ds, nsteps, 'tan_accel');
    plot (r(:,1),r(:,2))
  end
end

%
% Draw circles indicating where the Sun and Earth are
%
dtheta = 5;
ncirc = 360/dtheta;

xcirc = 1: ncirc;
ycirc = 1: ncirc;
for i = 1: ncirc
  theta = (i-1) * dtheta * pi/180;
  xcirc(i) = rad_Sun*cos(theta);
  ycirc(i) = rad_Sun*sin(theta);
end
plot ( xcirc, ycirc, '-r' );

xcirc = 1: ncirc;
ycirc = 1: ncirc;
for i = 1: ncirc
  theta = (i-1) * dtheta * pi/180;
  xcirc(i) = R_E + rad_Earth*cos(theta);
  ycirc(i) = rad_Earth*sin(theta);
end
plot ( xcirc, ycirc, '-m' );

%
% Add the finishing touches
%
xlabel('x (m)');
ylabel('y (m)');
title('Gravitational Field due to Sun and Earth');
axis([ -R_E*0.1 R_E*2 -R_E*0.01 R_E*0.01 ]);
%axis([ R_E-10*rad_Earth R_E+10*rad_Earth -10*rad_Earth 10*rad_Earth ]);
