# Resource-Allocation LP Template

This note preserves the reusable mathematical structure of a two-product resource-allocation problem without publishing an active-course answer key.

## Sets

Let $\mathcal I$ index products and $\mathcal R$ index resources.

## Parameters

```math
p_i=\text{unit profit of product }i,
```

```math
a_{ri}=\text{units of resource }r\text{ consumed per unit of product }i,
```

```math
b_r=\text{available capacity of resource }r.
```

## Decision variables

```math
x_i=\text{quantity of product }i\text{ produced},\qquad x_i\in\mathbb R_+.
```

## Model

```math
\begin{aligned}
\max_x\quad & \sum_{i\in\mathcal I}p_i x_i\\
\text{s.t.}\quad
& \sum_{i\in\mathcal I}a_{ri}x_i\le b_r, &&\forall r\in\mathcal R,\\
& x_i\ge0, &&\forall i\in\mathcal I.
\end{aligned}
```

## Physical interpretation

Every resource constraint follows

```math
\text{resource used}\le\text{resource available}.
```

This pattern generalizes to labor, material, energy, time, storage, and emissions budgets.
