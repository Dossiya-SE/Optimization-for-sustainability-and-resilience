# Summation and Index Discipline

Indexed notation is compact only when every index has a precise role.

## Summation index

In

```math
\sum_{i=1}^{n}a_i x_i,
```

$i$ is a dummy index. It disappears after the summation is evaluated.

## Quantified index

In

```math
\sum_{j=1}^{n}a_{ij}x_j=b_i,\qquad \forall i\in[m],
```

$j$ is summed over, while $i$ identifies a family of constraints.

## Dangling/free index

An index is invalid when it appears without being summed over or quantified.

For example,

```math
\sum_{i=1}^{n}b_{ij}\le a_{ij}
```

is structurally problematic because $i$ is summed on the left but remains free on the right.

## Double summation

```math
\sum_{i=1}^{2}\sum_{j=1}^{3}a_i x_{ij}
```

enumerates all $(i,j)\in[2]\times[3]$:

```math
a_1x_{11}+a_1x_{12}+a_1x_{13}+a_2x_{21}+a_2x_{22}+a_2x_{23}.
```

## Compression

Repeated equations of the form

```math
a_{i1}x_1+a_{i2}x_2=b_i
```

for $i\in[3]$ can be written as

```math
\sum_{j=1}^{2}a_{ij}x_j=b_i,\qquad\forall i\in[3].
```

The row index $i$ identifies constraints; the column index $j$ identifies decision-variable coefficients.
