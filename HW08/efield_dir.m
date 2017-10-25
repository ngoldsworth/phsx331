function E_hat = efield_dir(r,s)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:  N. Goldsworth
% Date:    2017-10-25
% Class:   Phys 331
% Purpose: This functions takes a position vector as an input, with units
%          of centimeters 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Constants in Problem
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

%Position vector 'r'
 % r(1) = x
 % r(2) = y
  
%Vector for electric field created by parallel plates.
  %if(r(1)<(d-a) && r(1)>-a)
    E_plates = sigma/eps*[-1,0];     % Does not change with position as long as inbetween the plates,
                                     % and is constantly in -x direction
  
%Vector for electric field created by the sphere.
  if(norm(r)>R)
    E_sphere = K*Q*power(norm(r),-3)*r;
  else
    E_sphere = [0,0];
  end  
  
 %Net electric field vector
  E_net = E_plates + E_sphere;

%Direction by scaling
 E_hat= E_net/norm(E_net);