# Nelson's HW11 Stuff
For the first part of the assignment, see either:
- `plot_wavefunctionsHW11.m`
- `HW11_2.m`
  
`plot_wavefunctionsHW11.m` plots the sinusodials solution to the one-dimensional Scrodinger equation for the PIB for various values of k as described in HW11. `HW11_2.m` is a generalized version of the same program that lets you start at any n-value, and plots the 9 following n values, for a total of 10 plots.

For the second part of the assignment, I used `HW11_2.m` to find the next values such that *k* satisfied the boundary conditions.

For the third part of the assignment, I made the function `psi_l.m` to plot *k* as a continuous variable. There are no `x`'s in `psi_l.m`, as the plot is for when *x=L*.

## Plots
There are several versions of plots. `Plot-1-color` and `Plot-1-highlighted` are the same plot, however I have altered the colors on one so that it is easier to see which solutions satisfy the boundary conditions. This is also the case both `Plot-2-FindMore-Color` and `Plot-2-FindMore-Highlighted`

`Plot-3-psi_L` corresponds to the third part of the assignment. The intersections of the sine wave with the *x*-axis are values of *k* where *A*sin(*kx*)=0 at x=L, thus satisfying the boundary condition. 
