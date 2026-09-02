# Multi-Objective Optimization

A weighted-sum formulation can combine multiple performance dimensions:

```math
\min_x\quad w_C C(x)+w_E E(x)+w_R R(x),
```

with nonnegative weights.

A rigorous analysis should also investigate Pareto trade-offs rather than relying on one arbitrary weight vector.

Typical objectives may include cost, environmental burden, service loss, and recovery performance.
