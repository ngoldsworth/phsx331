function f = caseI( w, x )

% evaluate the functions describing the eigenmode of case I,
% a uniform string.  Argument w(3) is actually the eigenfrequency

c_sq = 100.0; % the square of the wave speed, c^2
f1 = w(2);
f2 = -w(1)*w(3)^2/c_sq;
f3 = 0;   % never change the eigenvalue --- trick!

f = [ f1, f2, f3 ];
