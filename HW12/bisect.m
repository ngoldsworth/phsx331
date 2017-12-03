function x_star = bisect( func_name, x_lft, x_rgt )

%  
%  Find a solution to the equation f(x) = 0 for the function
%  named func_name.m using the method of bisection.  
%  Begin with the interval [ x_lft, x_rgt ] and return the solution 
%  with relative error 0.5E-5.
%

f_lft = feval( func_name, x_lft );   %  f(x_lft) 
f_rgt = feval( func_name, x_rgt );   %  f(x_rgt) 

if f_lft*f_rgt > 0   % ooops.  see problem #4
  return             % bail.
end

while abs( x_rgt - x_lft ) > 1.0E-5*max( abs( [ x_lft x_rgt ] ) )

  x_mp = 0.5*( x_lft + x_rgt );     %  the midpoint
  f_mp = feval( func_name, x_mp );  %  f(x_mp)

  if f_mp == 0   % got lucky! see problem #5.
    x_star = x_mp;
    return
  end

  %  replace whichever end has the same sign as f(x_mp)
  if f_mp*f_lft > 0.0      % f(x_mp) is the same sign as f(x_lft) ...
    x_lft = x_mp;  %  replace x_lft
    f_lft = f_mp;  %  and f(x_lft)
  else                     % f(x_mp) is the same sign as f(x_rgt) ...
    x_rgt = x_mp;  %  replace x_rgt
    f_rgt = f_mp;  %  and f(x_rgt)
  end % end of if-else statement

end % end of while loop

x_star = 0.5*( x_lft + x_rgt ); % the value to return

