l=0:.01:7;
for i=1:length(l)
    y_A(i) = legendre_A(l(i));
    y_B(i) = legendre_B(l(i));
    y_C(i) = legendre_C(l(i));
    y_D(i) = legendre_D(l(i));
end
figure()
hold on
plot(l,y_A)
plot(l,y_B)
plot(l,y_C)
plot(l,y_D)
legend('Case A', 'Case B' , 'Case C', 'Case D')
xlabel('$$l$$','interpreter','latex')
ylabel('$$y(1)-1$$)','interpreter','latex')
