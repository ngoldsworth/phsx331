function plot_legendgres()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author:   Nelson Goldsworth
% Date:     3 Dec 2017
% Purpose:  This function plots the legendre polynomials for l=0,1,2,6, as
%           they aree the eigenvalue solutions to the HW12 problem
% Usage:    Run as functional script
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% In the previous parts of HW12, we found various l values that work for
% the given boundary conditions. 

% CREATE VALUES FOR INPUTING INTO LEGENDRE FUNCTION
    n=-1:.002:1;
%
% INITIALIZE ARRAYS
%
    PA=zeros(1,length(n));
    PB=zeros(1,length(n));
    PC=zeros(1,length(n));
    PD=zeros(1,length(n));

%
% CREATE ARRAYS FOR PLOTTING
%
for i=1:length(n)
    PA(i)=legendreP(0,n(i)); % Legendre polynomial for Case A, l=0
    PB(i)=legendreP(1,n(i)); % Legendre polynomial for Case B, l=1
    PC(i)=legendreP(2,n(i)); % Legendre polynomial for Case C, l=2
    PD(i)=legendreP(6,n(i)); % Legendre polynomial for Case D, l=6
end

%
% PLOT FROM ARRAYS CREATED ABOVE
%

    figure()
    hold on
    
  % Plot each Legendre polynomial
    plot(n,PA) % Plotting Legendre polynomial for Case A
    plot(n,PB) % Plotting Legendre polynomial for Case B
    plot(n,PC) % Plotting Legendre polynomial for Case C
    plot(n,PD) % Plotting Legendre polynomial for Case D
    
  % Create legend fot ploy
    leg1 = legend('Case A, $$l=0$$', 'Case B, $$l=1$$' , 'Case C, $$l=2$$', 'Case D, $$l=6$$')
    set(leg1, 'interpreter', 'latex')
        % Define the legend as 'leg1', and set the interpreter for leg1 as
        % LaTeX, so that labels on plots come out neater.
  % Create labels for the plot's axes
    xlabel('$$x$$','interpreter','latex')
    ylabel('$$P_l (x)$$','interpreter','latex')
    title('$$P_l(x)$$ vs $$x$$, Legendre Polynomials as eigenfunction solutioms for HW12','interpreter','latex')
