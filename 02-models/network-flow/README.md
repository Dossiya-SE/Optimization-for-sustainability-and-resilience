# Network Flow

A network model uses a node set $\mathcal N$ and arc set $\mathcal A$.

A canonical conservation equation is

```math
\sum_{j:(j,i)\in\mathcal A}x_{ji}-\sum_{j:(i,j)\in\mathcal A}x_{ij}=b_i,\qquad\forall i\in\mathcal N.
```

This is the network analogue of the production-flow balance law.
