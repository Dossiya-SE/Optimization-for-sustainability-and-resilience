# IEE 574 Notation Standard

Use the same mathematical architecture throughout the course notes.

## Global sets and symbols

```math
\mathbb R=\text{real numbers},\qquad
\mathbb R_+=\text{nonnegative real numbers},\qquad
[n]=\{1,\ldots,n\}.
```

## Vector and matrix notation

```math
x\in\mathbb R^n,\qquad
A\in\mathbb R^{m\times n}.
```

- $x_i$: component $i$ of $x$,
- $a_{ij}$: entry $(i,j)$ of $A$,
- $A_j$: column $j$,
- $a_i^\top$: row $i$.

## Modeling order

```math
\text{sets/indices}\rightarrow\text{parameters}\rightarrow\text{decision variables}\rightarrow\text{objective}\rightarrow\text{constraints}\rightarrow\text{domains}.
```

## Constraint interpretation

Capacity:

```math
\text{resource used}\le\text{resource available}.
```

Balance:

```math
\text{flow in}=\text{flow out}.
```

Every equation should be accompanied by a physical or decision interpretation when used in an engineering model.
