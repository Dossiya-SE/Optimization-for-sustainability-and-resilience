# IEE 574 Modeling and Reasoning Protocol

This note defines the default reasoning, mathematical formulation, presentation, and verification workflow for **IEE 574 — Applied Deterministic Operations Research**.

The purpose is not to use tables as decoration. Tables are used as **model-debugging and reasoning instruments** that expose the structure of an optimization problem before computation.

## Core workflow

```math
\boxed{
\text{Read}
\rightarrow
\text{Extract}
\rightarrow
\text{Visualize}
\rightarrow
\text{Tabulate}
\rightarrow
\text{Formulate}
\rightarrow
\text{Audit}
\rightarrow
\text{Solve}
\rightarrow
\text{Verify}
}
```

For substantial problems, the full engineering workflow is:

```math
\boxed{
\begin{array}{cl}
1.&\text{Problem interpretation}\\
2.&\text{System / flow diagram}\\
3.&\text{Sets and indices}\\
4.&\text{Parameters}\\
5.&\text{Decision variables}\\
6.&\text{Assumptions}\\
7.&\text{Objective derivation}\\
8.&\text{Constraint derivation}\\
9.&\text{Complete mathematical model}\\
10.&\text{Index, unit, and domain audit}\\
11.&\text{Computational implementation}\\
12.&\text{Results table}\\
13.&\text{Verification}\\
14.&\text{Engineering interpretation}
\end{array}}
```

---

## 1. Read and extract the mathematical objects

Before writing equations, identify:

```math
\boxed{
\mathcal I,\;\mathcal J,\;\text{parameters},\;\text{decision variables},\;\text{objective},\;\text{constraints},\;\text{domains}
}
```

The first question is always:

```math
\boxed{\text{What is known, and what must the model choose?}}
```

Known quantities are **parameters**. Quantities selected by the optimization model are **decision variables**.

---

## 2. Visualize the physical or decision system

Whenever the problem contains flows, stages, networks, resources, or interactions, draw the structure before writing the algebra.

Example multistage production structure:

```math
x_1\rightarrow x_2\rightarrow x_3
```

with external outputs

```math
x_i\rightarrow y_i.
```

The diagram should answer:

- What moves?
- Between which entities?
- What is consumed or produced?
- What limits the movement?
- Where does the decision enter?

The diagram is a bridge between the engineering statement and the mathematical formulation.

---

## 3. Build the notation table before formulation

A model should not use an undefined symbol.

| Symbol | Classification | Meaning | Domain / units |
|---|---|---|---|
| $i$ | index | generic stage, product, node, or activity | $i\in\mathcal I$ |
| $j$ | index | generic resource, destination, or constraint | $j\in\mathcal J$ |
| $x_i$ | decision variable | quantity selected by the model | $x_i\ge 0$ |
| $d_i$ | parameter | required demand | known data |
| $c_i$ | parameter | unit cost or profit coefficient | known data |

### Notation test

```math
\boxed{\text{Can every symbol be explained before it appears in an equation?}}
```

If not, the formulation is not ready.

---

## 4. Translate engineering statements one at a time

Do not jump directly from prose to the full optimization model.

Use the reasoning chain:

```math
\boxed{
\text{sentence}
\rightarrow
\text{physical relationship}
\rightarrow
\text{mathematical expression}
}
```

Example:

| Engineering statement | Mathematical statement | Model role |
|---|---|---|
| Stage 1 must supply external demand and Stage 2 internal use | $y_1+b_2x_2\le x_1$ | balance / availability |
| Stage 2 must supply external demand and Stage 3 internal use | $y_2+b_3x_3\le x_2$ | balance / availability |
| Stage 3 external output cannot exceed production | $y_3\le x_3$ | balance / availability |
| Production cannot be negative | $x_i\ge0$ | domain |
| External output cannot be negative | $y_i\ge0$ | domain |

Every constraint should have a physical or decision interpretation.

---

## 5. Constraint audit

Every constraint must pass a structural audit before computation.

| Audit question | What to verify |
|---|---|
| Physical meaning | Does the equation represent the stated engineering rule? |
| Units | Are both sides dimensionally compatible? |
| Sign | Is the inequality direction physically correct? |
| Indexing | Are all indices valid and quantified? |
| Domain | Are nonnegativity, integrality, or binary restrictions stated? |
| Data/decision separation | Are parameters and variables conceptually distinct? |

Typical errors this audit is designed to catch:

```math
\boxed{
\text{wrong index}
+\text{missing quantifier}
+\text{unit mismatch}
+\text{wrong inequality direction}
+\text{parameter/variable confusion}
}
```

---

## 6. Index audit

For indexed models, explicitly distinguish **summation indices** from **free indices**.

| Expression | Summation index | Free index | Required qualifier |
|---|---|---|---|
| $\sum_i a_i x_i$ | $i$ | none | none |
| $\sum_i a_{ij}x_i\le b_j$ | $i$ | $j$ | $\forall j\in\mathcal J$ |
| $\sum_j x_{ij}=d_i$ | $j$ | $i$ | $\forall i\in\mathcal I$ |

Permanent rule:

```math
\boxed{\text{A summed index disappears; a free index must be quantified.}}
```

Example:

```math
\sum_{i\in\mathcal I} a_{ij}x_i\le C_j,
\qquad \forall j\in\mathcal J.
```

Here $i$ is summed over, while $j$ remains free and therefore requires an explicit quantifier.

---

## 7. Write the compact canonical model only after derivation

After the notation, physical interpretation, and audits are complete, write the mathematical model in canonical form.

Generic linear-programming structure:

```math
\begin{aligned}
\max_x\quad & c^\top x\\
\text{s.t.}\quad
& Ax\le b,\\
& x\ge0.
\end{aligned}
```

Indexed form:

```math
\begin{aligned}
\max_x\quad
& \sum_{i\in\mathcal I} c_i x_i\\
\text{s.t.}\quad
& \sum_{i\in\mathcal I} a_{ij}x_i\le C_j,
&&\forall j\in\mathcal J,\\
& x_i\ge0,
&&\forall i\in\mathcal I.
\end{aligned}
```

The compact model is the **result of the reasoning**, not the starting point.

---

## 8. Computational implementation

The computational model should implement the mathematical model exactly.

For Julia/JuMP, the conceptual mapping is:

```text
sets / indices     -> Julia index sets
parameters         -> input data
variables          -> @variable
constraints        -> @constraint
objective          -> @objective
solution           -> optimize!
verification       -> value, objective_value, residual/slack checks
```

Example structure:

```julia
@variable(model, x[1:3] >= 0)
@variable(model, y[1:3] >= 0)

@constraint(model, y[1] + b[2] * x[2] <= x[1])
@constraint(model, y[2] + b[3] * x[3] <= x[2])
@constraint(model, y[3] <= x[3])

@objective(model, Max, sum(p[i] * y[i] for i in 1:3))
```

Permanent rule:

```math
\boxed{\text{Code implements the model; code does not define the engineering meaning of the model.}}
```

---

## 9. Results table

Do not present raw solver output as the final engineering result.

| Quantity | Optimal value | Interpretation |
|---|---:|---|
| $x_i^\star$ | computed value | optimal decision for $x_i$ |
| $y_i^\star$ | computed value | optimal external output |
| $z^\star$ | computed value | optimal objective value |

The result table should connect the numerical solution back to the engineering problem.

---

## 10. Verification

A numerical solution is not complete until it has been checked.

| Check | Mathematical test |
|---|---|
| Feasibility | $Ax^\star\le b$ |
| Variable domain | $x^\star\in\mathcal X$ |
| Balance | equality constraints are satisfied |
| Capacity | resource limits are respected |
| Objective | $z^\star=c^\top x^\star$ |
| Physical meaning | solution is consistent with the modeled system |

### Slack and binding constraints

For a constraint

```math
a_j^\top x\le b_j,
```

define its slack as

```math
s_j=b_j-a_j^\top x^\star.
```

Then

```math
s_j=0
```

indicates a binding constraint, while

```math
s_j>0
```

indicates unused capacity.

This turns a solver result into optimization analysis.

---

## 11. Overleaf table standard

Tables used in written solutions should be structurally clear, compact, and mathematically meaningful.

Recommended packages:

```latex
\usepackage{array}
\usepackage{tabularx}
\usepackage{amsmath,amssymb}

\renewcommand{\arraystretch}{1.25}
```

Recommended model-definition table structure:

```latex
\begin{table}[htbp]
\centering
\caption{Mathematical model definition}
\label{tab:model-definition}

\begin{tabularx}{\textwidth}{
    >{\raggedright\arraybackslash}p{2.5cm}
    >{\centering\arraybackslash}p{2.2cm}
    >{\raggedright\arraybackslash}p{3cm}
    X
}
\hline
\textbf{Object} &
\textbf{Symbol} &
\textbf{Type} &
\textbf{Interpretation} \\
\hline

Production &
$x_i$ &
Decision variable &
Quantity of product $i$ produced. \\

Demand &
$d_i$ &
Parameter &
Required demand for product $i$. \\

Unit profit &
$p_i$ &
Parameter &
Profit obtained from one unit of product $i$. \\

Capacity &
$C_j$ &
Parameter &
Available amount of resource $j$. \\

\hline
\end{tabularx}
\end{table}
```

Use `tabularx` when explanatory text needs flexible column widths. Use `\caption`, `\label`, and `\ref` so tables are part of the mathematical narrative rather than isolated formatting objects.

Reference: [Overleaf — Tables](https://www.overleaf.com/learn/latex/Tables)

---

## 12. Default architecture for IEE 574 submissions and notes

For every substantial problem, use the following order unless the problem requires a simpler presentation:

1. **Problem interpretation**
2. **Diagram / system representation**
3. **Sets and indices**
4. **Parameters table**
5. **Decision-variable table**
6. **Assumptions**
7. **Objective derivation**
8. **Constraint derivation table**
9. **Canonical mathematical formulation**
10. **Index / unit / domain audit**
11. **Julia implementation**
12. **Results table**
13. **Verification**
14. **Engineering interpretation**

The governing principle is:

```math
\boxed{\text{Tables are not decoration; they are a model-debugging system.}}
```

and the full reasoning chain is:

```math
\boxed{
\text{engineering meaning}
\rightarrow
\text{mathematical structure}
\rightarrow
\text{computational implementation}
\rightarrow
\text{verification}
\rightarrow
\text{engineering interpretation}
}
```

This protocol should be applied consistently across future IEE 574 coursework while respecting course academic-integrity requirements.