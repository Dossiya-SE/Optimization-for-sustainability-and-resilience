# Vectors, Span, Linear Independence, and Basis

## Standard coordinates

For $x\in\mathbb R^n$,

```math
x=\begin{bmatrix}x_1\\x_2\\\vdots\\x_n\end{bmatrix}=\sum_{i=1}^{n}x_i e_i,
```

where $e_i$ is the standard unit vector with $1$ in coordinate $i$ and zeros elsewhere.

In $\mathbb R^2$,

```math
e_1=\begin{bmatrix}1\\0\end{bmatrix},\qquad e_2=\begin{bmatrix}0\\1\end{bmatrix},
```

so every $x=[x_1\;x_2]^\top$ has the unique representation

```math
x=x_1e_1+x_2e_2.
```

## Span

For vectors $a_1,\ldots,a_k\in\mathbb R^n$,

```math
\operatorname{Span}\{a_1,\ldots,a_k\}=\left\{\sum_{j=1}^{k}\lambda_j a_j:\lambda_j\in\mathbb R\right\}.
```

A set spans $\mathbb R^n$ when every vector in $\mathbb R^n$ can be represented as such a linear combination.

## Linear independence

The set $\{a_1,\ldots,a_k\}$ is linearly independent if

```math
\sum_{j=1}^{k}\lambda_j a_j=0\quad\Longrightarrow\quad \lambda_j=0,\qquad\forall j\in[k].
```

Interpretation: no vector in the set is redundant.

## Basis

A set $S\subset\mathbb R^n$ is a basis if

```math
\operatorname{Span}(S)=\mathbb R^n
```

and the vectors in $S$ are linearly independent. Thus,

```math
\text{basis}=\text{spanning set}+\text{linear independence}.
```

## Matrix notation

For $A\in\mathbb R^{m\times n}$:

- $a_{ij}$ is entry $(i,j)$,
- $A_j\in\mathbb R^{m\times1}$ is column $j$,
- $a_i^\top\in\mathbb R^{1\times n}$ is row $i$.

Dimension checks are part of the mathematics, not decoration.
