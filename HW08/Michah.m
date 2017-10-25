% Author:  M. Johnson
% Date:    2017-25-11
% Class:   Phys 331
% Plots the Electric field lines due to charged sphere between charged
% plates. Also plots the plates and sphere. Evaluates field using rk2.m.

R=.00146;       %m
a=.00273;       %m
d=.01;          %m

close all
figure()
hold on

%loop prep
dtheta = 30;
ncirc = 180/dtheta;
xcirc = 1:ncirc;
ycirc = 1:ncirc;
% runga kutta and plot just inside sphere
for i = 1: (ncirc+1)
  theta = ((i-1) * dtheta * pi/180) - pi/2;     %rad
  xcirc(i) = a + (R-.00001)*cos(theta);         %m
  ycirc(i) = (R-.00001)*sin(theta);             %m
end
xs=xcirc;
ys=ycirc;

%loop prep
dtheta = 15;
ncirc = 180/dtheta;
xcirc = 1:ncirc;
ycirc = 1:ncirc;
% runga kutta and plot just outside sphere
for i = 1: (ncirc+1)
  theta = ((i-1) * dtheta * pi/180) - pi/2;     %rad
  xcirc(i) = a + (R+.00001)*cos(theta);         %m
  ycirc(i) = (R+.00001)*sin(theta);             %m
end

%array of xs and ys just inside and outside of sphere
xs=[xs xcirc];
ys=[ys ycirc];

% performs runga kutta starting at on the right plate
for y=-.005:.001:.005
    r=rk2([d y], 0,.0001,1000,'tanacc');    % runga kutta
    plot(r(:,1),r(:,2),'k')                 % plots field lines
end

% performs runga kutta starting on the edge of the sphere
for i=1:length(xs)
    r=rk2([xs(i) ys(i)],0,.0001,1000,'tanacc');     % runga kutta
    plot(r(:,1),r(:,2),'k')                         % plots field lines
end

% loop prep
dtheta = 1;
ncirc = 360/dtheta;
xcirc = 1: ncirc;
ycirc = 1: ncirc;
% plots sphere
for i = 1: ncirc
  theta = (i-1) * dtheta * pi/180;  %rad
  xcirc(i) = a + R*cos(theta);      %m
  ycirc(i) = R*sin(theta);          %m
end


%plot plates,sphere, and format
plot ( xcirc, ycirc,'b');
plot([0 0],[-5*a 5*a],'r')
plot([d d],[-5*a 5*a],'r')
xlabel('Distance (m)')
ylabel('Distance (m)')
xlim([0 d])
title('Electric Field Lines due to Sphere between Plates')
