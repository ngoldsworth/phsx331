function e_fieldlines()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  N. Goldsworth
% Date:    2017-10-25
% Class:   Phys 331
% Purpose: This function will plot the electric field field lines due to 
%          the charged sphere and plates as described in HW06 and HW08
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Physical Parameters
  Q = 0.2400;        % charge on sphere in microCoulumbs
  sigma = .1200;     % charge density in microCoulumbs per square centimeter
  d = 1.000;         % distance between parallel plates, in centimeters
  a = 0.273;         % distance from the origin to the negative plate. Note
                     % that this quantity is a distance, and that the x plate
                     % sits at x=-a
  R = 0.146;         % radius of sphere in centimeters
  Vo = 0;            % potential of V(x) at x=0, in myriaVolts
                     % **note: 1 mryiaVolt = 10,000 Volts, weird unit
  eps = 8.857e-4;    % value of the electric constant in uC^2 / Ncm^2
  K = 1/(4*pi*eps);  % value of coulumbs constant, in Newton*cm^2 / uC^2


%
% Calculational parameters
%
s0 = 0;                  % start at beginning of curve
ds = 0.01;               % step size
nsteps = 100;            % number of points in each field line
R = 0.146;               % radius of sphere in centimeters

%
% Start with a clean slate
%
newplot
hold on

%
% Plot some lines starting near the x-axis
%
ymin = -10*R;
dy = R;
ymax = 10*R;
xmin = -a;
dx = 0.1*R;
xmax = d-a;

for y = ymin: dy: ymax
  for x = xmin: dx: xmax
    r = rk2( [x,y], s0, ds, nsteps, 'efield_dir');
    plot (r(:,1),r(:,2))
  end
end

%
% Draw circles indicating where the Sphere is
%
dtheta = 5;
ncirc = 360/dtheta;

xcirc = 1: ncirc;
ycirc = 1: ncirc;
for i = 1: ncirc
  theta = (i-1) * dtheta * pi/180;
  xcirc(i) = R*cos(theta);
  ycirc(i) = R*sin(theta);
end
plot ( xcirc, ycirc, '-r' );


plot ( xcirc, ycirc, '-m' );

%
% Add the finishing touches
%
xlabel('x (cm)');
ylabel('y (cm)');
title('Electric Field Lines');
axis([ -R_E*0.1 R_E*2 -R_E*0.01 R_E*0.01 ]);
%axis([ R_E-10*rad_Earth R_E+10*rad_Earth -10*rad_Earth 10*rad_Earth ]);
