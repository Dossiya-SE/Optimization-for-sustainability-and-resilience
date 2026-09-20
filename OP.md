# /op — Optimization Engineering Workflow

> Canonical workflow for rigorous optimization problem solving in IEE 574 and related engineering optimization work.

## Invocation

Use:

```text
/op
```

or

```text
/op <problem, exercise, model, file, or question>
```

The command means: **apply the full Optimization Engineering Workflow before accepting a result as complete**.

---

What we learned from Problems 2–4 is bigger than how to make a good figure. We developed a **repeatable optimization problem-solving method** in which mathematics is the authority, geometry explains the mathematics, engineering gives meaning to the variables and constraints, and computation verifies rather than invents the answer.

I would formalize our method as:

\`\`\`math
\boxed{ \textbf{Optimization Engineering Workflow} }
\`\`\`

\`\`\`math
\boxed{ \text{FORMULATE} \rightarrow \text{NORMALIZE} \rightarrow \text{CLASSIFY} \rightarrow \text{DERIVE} \rightarrow \text{VERIFY} \rightarrow \text{INTERPRET} \rightarrow \text{VISUALIZE} \rightarrow \text{COMPUTE} \rightarrow \text{AUDIT} \rightarrow \text{FREEZE} }
\`\`\`

## 1. The main lesson: never begin with the solver or the plot

At the beginning, many difficulties came from trying to draw something before completely knowing what the mathematical objects were.

The improved principle is

\`\`\`math
\boxed{ \text{Mathematics} \rightarrow \text{Geometry} \rightarrow \text{Engineering meaning} \rightarrow \text{Computation} }
\`\`\`

not

\`\`\`math
\text{code} \rightarrow \text{picture} \rightarrow \text{guess what it means}.
\`\`\`

For every future optimization exercise, the first question should be:

\`\`\`math
\boxed{\text{What mathematical object is this problem defining?}}
\`\`\`

A point? A line? A hyperplane? A half-space? A polyhedron? A cone? A feasible set? An objective contour? A direction? A basis? An extreme point? A redundant constraint?

Until that is clear, we should not draw.

---

# 2. Our three synchronized representations

Every optimization problem should be solved simultaneously in three representations.

| Representation | Question |
| --- | --- |
| **Mathematical** | What equations, inequalities, sets, functions, variables, parameters, and logical statements define the problem? |
| **Geometric** | What do those objects look like in the relevant space? Which boundaries, intersections, directions, vertices, cones, and regions exist? |
| **Engineering** | What physical, operational, economic, sustainability, or system meaning does each variable and constraint have? |

Then computation becomes a fourth layer:

\`\`\`math
\boxed{ \text{Computation}=\text{verification and scaling layer} }
\`\`\`

rather than the source of the reasoning.

For example, a constraint

\`\`\`math
5x_1+3x_2\le50
\`\`\`

should immediately be seen in four ways:

\`\`\`math
\boxed{
\begin{array}{ll}
\text{algebra} &: 5x_1+3x_2\le50,\\[1mm]
\text{geometry} &: \text{a half-space},\\[1mm]
\text{boundary} &: 5x_1+3x_2=50,\\[1mm]
\text{engineering} &: \text{a limited resource/capacity relationship}.
\end{array}}
\`\`\`

That should become automatic.

---

# 3. Step 1 — FORMULATE exactly

Before solving anything, create an authoritative mathematical statement.

For a generic optimization problem:

\`\`\`math
\boxed{
\begin{aligned}
\max/\min\quad & f(x)\\
\text{s.t.}\quad
& g_i(x)\le0,\qquad i\in\mathcal I,\\
& h_j(x)=0,\qquad j\in\mathcal J,\\
& x\in\mathcal X.
\end{aligned}}
\`\`\`

Then classify every symbol.

| Symbol | Role |
| --- | --- |
| \(x\) | decision variable |
| \(c,a_i,b_i\) | known parameters |
| \(f(x)\) | objective |
| \(g_i(x)\le0\) | inequality constraint |
| \(h_j(x)=0\) | equality constraint |
| \(\mathcal X\) | domain |
| \(i,j\) | indices |

This prevents one of the most common optimization mistakes:

\`\`\`math
\boxed{\text{parameter}\neq\text{decision variable}.}
\`\`\`

---

# 4. Step 2 — NORMALIZE the mathematics

Rewrite constraints into forms that expose their structure.

For example,

\`\`\`math
x_1-2x_2\ge-6
\`\`\`

can be represented equivalently as

\`\`\`math
-x_1+2x_2\le6
\`\`\`

or, for geometric drawing,

\`\`\`math
x_2\le\frac12x_1+3.
\`\`\`

These forms serve different purposes.

\`\`\`math
\boxed{
\begin{array}{lll}
a^\top x\le b &\rightarrow& \text{optimization/standard form},\\
x_2=mx_1+b &\rightarrow& \text{2-D geometric interpretation}.
\end{array}}
\`\`\`

Do not confuse equivalence with purpose: retain the original mathematical constraint while deriving whatever representation makes the geometry easier to understand.

---

# 5. Step 3 — CLASSIFY the mathematical objects

For each element, explicitly decide:

\`\`\`math
\boxed{ \text{What is it?} }
\`\`\`

Examples:

\`\`\`math
\begin{array}{rcl}
a^\top x=b &:& \text{hyperplane},\\
a^\top x\le b &:& \text{half-space},\\
X=\{x:Ax\le b\} &:& \text{polyhedron},\\
x^* &:& \text{point},\\
d &:& \text{direction},\\
c &:& \text{objective coefficient/gradient},\\
\operatorname{rec}(X) &:& \text{recession cone}.
\end{array}
\`\`\`

Critically:

\`\`\`math
\boxed{ \text{constraint} \neq \text{constraint boundary} \neq \text{active feasible facet} }
\`\`\`

A redundant constraint can belong to the mathematical model while contributing no feasible edge.

---

# 6. Step 4 — DERIVE geometry analytically

Never estimate intersections visually.

For every candidate vertex, solve the corresponding active equalities exactly. If

\`\`\`math
a_i^\top x=b_i
\`\`\`

and

\`\`\`math
a_j^\top x=b_j
\`\`\`

are potentially active, solve

\`\`\`math
\begin{bmatrix}
a_i^\top\\
a_j^\top
\end{bmatrix}x
=
\begin{bmatrix}
b_i\\
b_j
\end{bmatrix}.
\`\`\`

Then verify the resulting point against all constraints.

\`\`\`math
\boxed{
\text{intersection}
\rightarrow
\text{candidate point}
\rightarrow
\text{feasibility test}
\rightarrow
\text{vertex/nonvertex classification}.
}
\`\`\`

---

# 7. Step 5 — determine boundedness and recession structure

\`\`\`math
\boxed{\text{A plotting window must never be mistaken for a mathematical boundary}.}
\`\`\`

If

\`\`\`math
X=\{x:Ax\le b\},
\`\`\`

then

\`\`\`math
\operatorname{rec}(X)=\{d:Ad\le0\}.
\`\`\`

The set is bounded exactly when

\`\`\`math
\operatorname{rec}(X)=\{0\}.
\`\`\`

For unboundedness, prove it with a nonzero direction \(d\) satisfying

\`\`\`math
x+\lambda d\in X \qquad \forall\lambda\ge0.
\`\`\`

---

# 8. Step 6 — analyze the objective geometrically

For a linear objective

\`\`\`math
Z=c^\top x,
\`\`\`

the level sets are

\`\`\`math
\boxed{c^\top x=k}.
\`\`\`

The vector

\`\`\`math
\boxed{c=\nabla Z}
\`\`\`

is normal to every objective contour.

For any tangent direction \(t\),

\`\`\`math
\boxed{c^\top t=0}.
\`\`\`

For maximization, increasing objective values occur in the direction of \(c\); for minimization, in the direction of \(-c\).

\`\`\`math
\boxed{\text{move an objective hyperplane parallel to itself in the improvement direction}.}
\`\`\`

---

# 9. Step 7 — solve, then produce an optimality certificate

Do not stop at

\`\`\`math
x^*=\text{some point}.
\`\`\`

For small LPs, evaluate the objective at all extreme points:

\`\`\`math
Z(v_1),Z(v_2),\ldots,Z(v_m).
\`\`\`

Where useful, derive a stronger certificate. If

\`\`\`math
c=\lambda_1a_1+\lambda_2a_2,\qquad \lambda_i\ge0,
\`\`\`

using normals of active constraints at \(x^*\), then those constraints can establish a direct bound on the objective.

This connects geometric LP reasoning to:

\`\`\`math
\boxed{\text{duality}+\text{KKT conditions}+\text{normal cones}+\text{optimality certificates}.}
\`\`\`

---

# 10. Step 8 — translate the mathematics into engineering meaning

Every constraint should answer:

\`\`\`math
\boxed{\text{What engineering mechanism produces this equation or inequality?}}
\`\`\`

Examples:

\`\`\`math
\begin{array}{lll}
\sum_i x_i\le C &\rightarrow& \text{capacity},\\[1mm]
\sum_i x_i=d &\rightarrow& \text{balance/conservation},\\[1mm]
x_i\le My_i &\rightarrow& \text{logical linkage},\\[1mm]
x_i\ge0 &\rightarrow& \text{physical/domain restriction},\\[1mm]
Ax=b &\rightarrow& \text{flow/mass/energy conservation}.
\end{array}
\`\`\`

For sustainability and infrastructure work, classify mechanisms such as capacity, energy balance, transport flow, emissions, budget, reliability, service, resilience, and policy.

---

# 11. Step 9 — design the figure from ontology

Do not move labels until they merely “look acceptable.”

Use:

\`\`\`math
\boxed{\text{mathematical object}\rightarrow\text{geometric role}\rightarrow\text{visual grammar}.}
\`\`\`

| Mathematical object | Visual rule |
| --- | --- |
| feasible region | light transparent fill |
| full constraint hyperplane | thin/faint line |
| active feasible facet | stronger segment |
| redundant constraint | muted/dashed |
| objective contour | distinct contour family |
| point | marker |
| optimal point | stronger unique marker |
| vector | arrow |
| coordinate label | same color as point |
| line equation | same color as line |
| vector equation | same color as vector |

\`\`\`math
\boxed{\text{same object}\Rightarrow\text{same color + same direction + spatial proximity}.}
\`\`\`

---

# 12. Label positions should also be mathematical

For a line

\`\`\`math
a^\top x=b,
\`\`\`

choose an anchor \(p\) satisfying

\`\`\`math
a^\top p=b.
\`\`\`

Then offset the label in the normal direction:

\`\`\`math
\boxed{
p_{\text{label}}
=
p+\varepsilon\frac{a}{\|a\|}.
}
\`\`\`

For a vector \(v\), use its midpoint

\`\`\`math
m=p+\frac12v
\`\`\`

and a perpendicular offset:

\`\`\`math
\boxed{
m_{\text{label}}
=
m+\varepsilon\frac{(-v_2,v_1)}{\|v\|}.
}
\`\`\`

---

# 13. Step 10 — computation must contain assertions

Julia code must act as a verification program, not only a plotting program.

Examples:

\`\`\`julia
@assert feasible(v1)
@assert feasible(v2)
@assert isapprox(dot(c, tangent), 0.0)
@assert objective(xstar) ≥ objective(v1)
@assert isapprox(A[i,:]' * xstar, b[i])
\`\`\`

\`\`\`math
\boxed{\text{If an essential mathematical property fails, the figure must not render silently.}}
\`\`\`

---

# 14. Step 11 — separate analytical truth from numerical verification

For small homework exercises:

\`\`\`math
\boxed{\text{derive first, solver second}.}
\`\`\`

Use analytical derivation plus independent numerical verification.

For large engineering models, computational solution becomes operationally central, but the model still needs to be understood before solver output is trusted.

---

# 15. Step 12 — rendering is part of verification

A program can execute successfully while its figure remains scientifically poor.

\`\`\`math
\boxed{\text{code PASS}\neq\text{figure PASS}.}
\`\`\`

Audit the rendering for wrong-side shading, false boundaries, incorrect scaling, label collisions, wrong coordinates, misleading colors, wrong arrows, and clipping.

---

# 16. Four independent PASS gates

| Gate | Required question | Typical failure |
| --- | --- | --- |
| **G1 Mathematical** | Are formulation and derivations correct? | wrong inequality orientation |
| **G2 Geometric** | Does the geometry exactly represent the mathematics? | fake boundary on an unbounded set |
| **G3 Engineering** | Is every variable/constraint/object interpretable? | meaningless coefficient or constraint |
| **G4 Computational/visual** | Does code reproduce the mathematics clearly? | solver/plot works but labels or facets are wrong |

\`\`\`math
\boxed{PASS=G_1\land G_2\land G_3\land G_4.}
\`\`\`

No single gate can compensate for failure of another.

---

# 17. Standard pre-code worksheet

Before coding, answer:

| Question | Required answer |
| --- | --- |
| **Decision variables?** | symbols, units, domains |
| **Parameters?** | values, units, source |
| **Objective?** | mathematical form + engineering meaning |
| **Constraints?** | mathematical form + mechanism |
| **Constraint type?** | equality / inequality / bound / linkage |
| **Geometric object?** | line / half-space / hyperplane / cone / polyhedron |
| **Intersections?** | derive exactly |
| **Feasible points?** | verify against every constraint |
| **Extreme points?** | derive and classify |
| **Redundant constraints?** | prove |
| **Bounded?** | prove or derive recession directions |
| **Objective contours?** | derive slope/normal |
| **Improvement direction?** | derive from \(c\) |
| **Optimum?** | derive |
| **Optimality certificate?** | vertex comparison / normal cone / dual |
| **Engineering meaning?** | explain each result |
| **Visual ontology?** | assign graphical representation |
| **Assertions?** | encode mathematical checks |
| **Solver verification?** | independent numerical check |
| **Rendered audit?** | inspect final figure |

---

# 18. Higher-dimensional extension

The method survives beyond two dimensions.

A line becomes a hyperplane:

\`\`\`math
a^\top x=b.
\`\`\`

A polygon becomes a polyhedron:

\`\`\`math
P=\{x:Ax\le b\}.
\`\`\`

A 2-D objective contour becomes a high-dimensional level hyperplane:

\`\`\`math
c^\top x=k.
\`\`\`

Extreme rays, active facets, normal vectors, optimality certificates, and recession analysis retain the same mathematical meaning.

---

# 19. Six-question engineering habit

For every important equation ask:

\`\`\`math
\boxed{
\begin{array}{ll}
1.&\text{What is defined?}\\
2.&\text{Why does it have this form?}\\
3.&\text{What geometry does it create?}\\
4.&\text{What engineering mechanism does it represent?}\\
5.&\text{How can I verify it?}\\
6.&\text{When would this statement no longer be valid?}
\end{array}}
\`\`\`

---

# 20. Final optimization-solving architecture

\`\`\`math
\boxed{
\begin{aligned}
\textbf{Phase I — Mathematical formulation}\\
\text{words}
&\rightarrow
\text{sets, variables, parameters, objective, constraints}
\\[2mm]
\textbf{Phase II — Structural analysis}\\
&\rightarrow
\text{normalization, redundancy, activity, boundedness}
\\[2mm]
\textbf{Phase III — Geometry}\\
&\rightarrow
\text{boundaries, feasible set, vertices, directions, contours}
\\[2mm]
\textbf{Phase IV — Optimization}\\
&\rightarrow
\text{improvement direction, optimum, certificate}
\\[2mm]
\textbf{Phase V — Engineering interpretation}\\
&\rightarrow
\text{physical meaning, units, mechanisms, trade-offs}
\\[2mm]
\textbf{Phase VI — Computational verification}\\
&\rightarrow
\text{Julia assertions + solver}
\\[2mm]
\textbf{Phase VII — Scientific visualization}\\
&\rightarrow
\text{ontology-driven figure}
\\[2mm]
\textbf{Phase VIII — Audit and freeze}\\
&\rightarrow
\text{mathematical + geometric + engineering + visual PASS}.
\end{aligned}}
\`\`\`

The objective is not merely to draw optimization problems. It is to **construct, interrogate, prove, interpret, compute, and communicate optimization models**.
