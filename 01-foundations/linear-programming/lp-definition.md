# Linear Programming

A linear program has a linear objective, linear constraints, continuous decision variables, and deterministic parameters.

## General form

```math
\begin{aligned}
\min_x\quad & c^\top x\\
\text{s.t.}\quad
& A_{\le}x\le b_{\le},\\
& A_=x=b_=,\\
& x\in\mathcal X.
\end{aligned}
```

## Linearity checks

Terms such as

```math
x_i^2,\qquad x_ix_j,\qquad x_i^{-1}
```

are nonlinear unless a valid reformulation is introduced.

## Engineering capacity structure

A common resource constraint is

```math
\sum_{i\in\mathcal I}a_{ri}x_i\le b_r,\qquad\forall r\in\mathcal R,
```

where $a_{ri}$ is resource use per unit and $b_r$ is available capacity.
