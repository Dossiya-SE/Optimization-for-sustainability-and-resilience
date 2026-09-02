# Transportation Models

A canonical transportation model uses origin set $\mathcal I$ and destination set $\mathcal J$.

```math
\min\quad \sum_{i\in\mathcal I}\sum_{j\in\mathcal J}c_{ij}x_{ij}
```

subject to origin supply, destination demand, and nonnegativity constraints.

The indices have physical meaning: $i$ denotes an origin and $j$ a destination.
