# Service Loss

Let $Q(t)$ denote delivered service and $Q_0(t)$ the required or target service level.

A continuous-time service-deficit measure is

```math
L=\int_0^T \left(Q_0(t)-Q(t)\right)_+\,dt.
```

For a discrete planning horizon $\mathcal T$,

```math
L=\sum_{t\in\mathcal T}w_t\left(d_t-q_t\right)_+,
```

where $d_t$ is required service, $q_t$ delivered service, and $w_t$ a time or importance weight.

Optimization may minimize service loss directly or combine it with restoration cost and recovery time.
