# Resilience Objectives

Resilience optimization may minimize service loss, recovery time, restoration cost, or a multi-objective combination.

Let $Q(t)$ denote delivered service and $Q_0(t)$ a target service level. A service-deficit objective can be written as

```math
\min\quad \int_0^T \left(Q_0(t)-Q(t)\right)_+\,dt.
```

Alternative formulations may constrain minimum service while minimizing cost, or optimize restoration schedules subject to resource limits.
