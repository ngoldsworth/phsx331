function plot_legendgres()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author:   Nelson Goldsworth
% Date:     3 Dec 2017
% Purpose:  This function plots the legendre polynomials for l=0,1,2,6
% Usage:    Run as functional script
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% In the previous parts of HW12, we found various l values that work for
% the given boundary conditions. 

n=-1:.002:1;

for i=1:length(n)
    PA(i)=legendreP(0,n(i)); % Legendre polynomial for Case A
    PB(i)=legendreP(1,n(i)); % Legendre polynomial for Case B
    PC(i)=legendreP(2,n(i)); % Legendre polynomial for Case C
    PD(i)=legendreP(6,n(i)); % Legendre polynomial for Case D
end
figure()
hold on
plot(n,PA) % Plotting Legendre polynomial for Case A
plot(n,PB) % Plotting Legendre polynomial for Case B
plot(n,PC) % Plotting Legendre polynomial for Case C
plot(n,PD) % Plotting Legendre polynomial for Case D
leg1 = legend('Case A, $$l=0$$', 'Case B, $$l=1$$' , 'Case C, $$l=2$$', 'Case D, $$l=6$$')
    set(leg1, 'Interpreter', 'latex')
xlabel('$$x$$','interpreter','latex')
ylabel('$$P_l (x)$$','interpreter','latex')
