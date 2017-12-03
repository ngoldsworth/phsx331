function plot_legendgres( )
% In the previous parts of the HW, we found various l values that work for
% the given boundary conditions. 

for i=0:.001:1
PA(i)=legendreP(0,i)
PB(i)=legendreP(1,i)
PC(i)=legendreP(2,i)
PD(i)=legendreP(6,i)
end
