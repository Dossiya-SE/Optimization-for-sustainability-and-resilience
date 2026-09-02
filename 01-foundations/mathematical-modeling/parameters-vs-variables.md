# Parameters vs. Decision Variables

This distinction is fundamental.

## Parameter

A parameter is known before optimization. Examples include capacities, unit costs, prices, processing times, demand, and conversion coefficients.

## Decision variable

A decision variable is selected by the optimization model. Examples:

```math
x_i=\text{quantity of product }i\text{ produced},
```

```math
y_{ij}=\text{flow from node }i\text{ to node }j.
```

## Diagnostic test

Ask: if this quantity changes while the problem instance is held fixed, is it a decision or does it redefine the data?

- If it changes the problem instance, it is a parameter.
- If the optimizer may choose it, it is a decision variable.
