function f = caseII( w, x )

% evaluate the functions describing the eigenmode of case II,
% a uniform string.  Argument w(3) is actually the eigenfrequency

c_sq = 1/( 0.001 + 0.018*x ); % *** the only line changed ***
f1 = w(2);
f2 = -w(1)*w(3)^2/c_sq;
f3 = 0;   % never change the eigenvalue --- trick!

f = [ f1, f2, f3 ];
