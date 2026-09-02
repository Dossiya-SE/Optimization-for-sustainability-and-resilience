# LP Standard Form

A standard equality-form LP is

```math
\begin{aligned}
\min\quad & c^\top x\\
\text{s.t.}\quad & Ax=b,\\
& x\ge0.
\end{aligned}
```

with

```math
A\in\mathbb R^{m\times n},\qquad x,c\in\mathbb R^n,\qquad b\in\mathbb R^m.
```

Componentwise,

```math
\sum_{j=1}^{n}a_{ij}x_j=b_i,\qquad\forall i\in[m].
```

## Slack variables

For

```math
a^\top x\le b,
```

introduce $s\ge0$:

```math
a^\top x+s=b.
```

The slack $s$ measures unused capacity.
