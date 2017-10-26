function f = tan_vec( r, s )

% compute the tangent vector to the electric field at point r

e = efld( r );    % evaluate components of the electric field
emag = sqrt( e(1)^2 + e(2)^2 );    % |E|

f = e/emag;          % the tangent vector
