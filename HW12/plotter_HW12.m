%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PLOTTER_HW12.m
% 
% Author:   Nelson Goldsworth
% Date:     3 Dec 2017
% Purpose:  This script generates the first plot so that the user can get a
%           general idea of where functions for each case intesect with the
%           l-axis. This will give the user an idea of where to place
%           bounds when using bisect.m on the functions later.
% Usage:    Run by pressing F5. This was used to make plot_01.jpg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

l=0:.01:7; % Create array of l values to plug into each function.

%
% INITIALIZE ARRAYS
%
    y_A=zeros(1,length(l));
    y_B=zeros(1,length(l));
    y_C=zeros(1,length(l));
    y_D=zeros(1,length(l));
%
% CREATE ARRAYS TO USE IN PLOTTING
%
  for i=1:length(l)
    y_A(i) = legendre_A(l(i)); % 2-column array for plotting Case A
    y_B(i) = legendre_B(l(i)); % 2-column array for plotting Case B
    y_C(i) = legendre_C(l(i)); % 2-column array for plotting Case C
    y_D(i) = legendre_D(l(i)); % 2-column array for plotting Case D
  end
  
%
% MAKE THE FIGURE
%
figure()
hold on

% Plot each array.
    plot(l,y_A)
    plot(l,y_B)
    plot(l,y_C)
    plot(l,y_D)
% Create legend with LaTeX interpreter for neatness
    leg1=legend('Case A', 'Case B' , 'Case C', 'Case D')
        set(leg1, 'interpreter', 'latex')
    xlabel('$$l$$','interpreter','latex')
    ylabel('$$y(1)-1$$)','interpreter','latex')
    title('$$l$$ vs $$y(1)-1$$ for $$y_a$$,$$y_B$$,$$y_C$$,$$y_D$$','interpreter','latex')

