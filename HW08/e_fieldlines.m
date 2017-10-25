% function e_fieldlines()

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
ds = 0.001;               % step size
nsteps = 1500;            % number of points in each field line
R = 0.146;               % radius of sphere in centimeters

%
% Start with a clean slate
%
newplot
hold on

%
% Plot some lines starting near the x-axis
%


%Starting points just inside the sphere
dtheta=15;
ncirc=180/dtheta;
xcirc=1:ncirc;
ycirc=1:ncirc;
% Runga Kutta and plot just inside the sphere
for i=1:(ncirc+1)
theta = ((i-1)*dtheta*pi/180)-pi/2;              % radians
xcirc(i) = (.999*R)*cos(theta);                  % cm
ycirc(i) = (.999*R)*sin(theta);                  % cm
end
xs=xcirc;
ys=ycirc;


%Starting points just outside the sphere
dtheta=30;
ncirc=180/dtheta;
xcirc=1:ncirc;
ycirc=1:ncirc;
for i=1:(ncirc+1)
theta = ((i-1)*dtheta*pi/180)-pi/2;              % radians
xcirc(i) = (1.001*R)*cos(theta);                 % cm
ycirc(i) = (1.001*R)*sin(theta);                 % cm
end
%Array of all starting points, just inside and outside the sphere.
xs=[xs xcirc];
ys=[ys ycirc];


% Draw circles indicating where the Sphere is
%
dtheta = 5;
ncirc = 360/dtheta;
xcirc = 1: ncirc;
ycirc = 1: ncirc;
for i = 1: (ncirc+1)
  theta = (i-1) * dtheta * pi/180;
  xcirc(i) = R*cos(theta);
  ycirc(i) = R*sin(theta);
end

%Runga-Kutta starting on the sphere
for i=1:length(xs)
    r=rk2([xs(i), ys(i)],s0,ds,nsteps,'efield_dir');      %Runga Kutta
    plot(r(:,1),r(:,2),'k')                               %Plots Field Lines
end
plot ( xcirc, ycirc, '-r' );

% performs runga kutta starting at on the right plate
for y=-.5:.1:.5
    r=rk2([d-a y], s0,.001,1200,'efield_dir');    % runga kutta
    plot(r(:,1),r(:,2),'k')                       % plots field lines
end

%
% Add the finishing touches
%
xlabel('x (cm)');
ylabel('y (cm)');
title('Electric Field Lines');