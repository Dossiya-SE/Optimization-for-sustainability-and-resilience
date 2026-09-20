# /op — Optimization Engineering Workflow v2.0

> Canonical protocol for rigorous optimization problem solving, mathematical geometry, engineering interpretation, scientific computing, and validated visualization.

## Invocation

Use:

~~~text
/op
/op here
/op <problem>
/op <exercise>
/op <model or file>
~~~

The command means: do not jump to a solver, plot, or final answer. Construct the mathematical object first, prove what can be proved, verify it computationally, render what must be rendered, audit it, and freeze only a validated result.

---

# 1. Core doctrine

The permanent rule is:

~~~math
\boxed{\text{A scientific figure is not decoration. It is a graphical proof of the mathematics.}}
~~~

The operational sequence is:

~~~text
QUESTION
→ FORMULATE
→ NORMALIZE
→ CLASSIFY
→ DERIVE
→ VERIFY
→ CERTIFY
→ INTERPRET
→ DESIGN
→ COMPUTE/CODE
→ ASSERT
→ RENDER
→ AUDIT
→ FREEZE
~~~

For visualization specifically:

~~~math
\boxed{
\text{mathematical object}
\rightarrow
\text{geometric role}
\rightarrow
\text{visual role}
}
~~~

Never reverse that order.

---

# 2. Four synchronized representations

Every optimization problem should be understood in four synchronized layers.

| Layer | Required question |
|---|---|
| Mathematics | What sets, variables, parameters, equations, inequalities, functions, and logical statements define the problem? |
| Geometry | What boundaries, half-spaces, faces, vertices, directions, cones, contours, normals, and tangents exist? |
| Engineering | What mechanism, unit, capacity, conservation law, policy, resource, service, or physical meaning does each object represent? |
| Computation | What should be derived exactly, what should be checked numerically, and what should code be allowed to claim? |

Computation is a verification and scaling layer. It must not silently become the source of mathematical truth.

---

# 3. Start from the exact question

Before modeling, write the exact question the exercise is asking.

Examples:

- characterize a feasible set;
- determine whether a polyhedron is bounded;
- find extreme points;
- identify active or redundant constraints;
- derive recession directions;
- optimize a linear objective;
- enumerate basic solutions;
- connect basic feasible solutions to extreme points.

Do not start with software.

---

# 4. Formulate exactly

A generic optimization problem is written as

~~~math
\boxed{
\begin{aligned}
\min/\max\quad & f(x)\\
\text{s.t.}\quad
& g_i(x)\le0,\qquad i\in\mathcal I,\\
& h_j(x)=0,\qquad j\in\mathcal J,\\
& x\in\mathcal X.
\end{aligned}}
~~~

Declare explicitly:

1. sets and indices;
2. parameters/input data;
3. decision variables;
4. objective;
5. constraints;
6. domains;
7. units when supplied;
8. assumptions;
9. requested outputs.

Keep parameters and decision variables conceptually separate.

---

# 5. Normalize without losing the source form

Keep the original formulation as authority, then derive equivalent forms for different purposes.

For example,

~~~math
a^\top x\le b
~~~

is useful for optimization and polyhedral reasoning, whereas in 2-D

~~~math
x_2=mx_1+\beta
~~~

may be useful for geometry.

Equivalent forms are tools, not replacements for the original model.

---

# 6. Classify the mathematical ontology

Before plotting or coding, classify every object.

| Mathematical object | Meaning |
|---|---|
| \(a^\top x=b\) | hyperplane / equality boundary |
| \(a^\top x\le b\) | half-space |
| \(X=\{x:Ax\le b\}\) | polyhedron |
| \(x^*\) | point / candidate or optimum |
| \(d\) | direction |
| \(\operatorname{rec}(X)\) | recession cone |
| \(c\) | objective coefficient / gradient |
| \(c^\top x=k\) | objective level hyperplane |
| basis \(B\) | selected independent columns |
| BFS | basic solution satisfying feasibility |

Always distinguish:

~~~math
\boxed{
\text{constraint}
\neq
\text{constraint boundary}
\neq
\text{active constraint}
\neq
\text{active feasible facet}
}
~~~

A constraint can be tight at one point without defining a facet.

---

# 7. Never confuse four geometries

Keep these separate:

~~~math
\boxed{
\text{model geometry}
\neq
\text{feasible-set geometry}
\neq
\text{objective geometry}
\neq
\text{display geometry}
}
~~~

- A full constraint line/hyperplane belongs to model geometry.
- Only part of it may belong to the feasible boundary.
- Objective contours are not constraints.
- A plot-box edge is not a mathematical boundary.

This distinction is mandatory for unbounded sets and redundant constraints.

---

# 8. Derive geometry analytically

Never eyeball intersections.

If two boundaries are potentially active,

~~~math
a_i^\top x=b_i,\qquad a_j^\top x=b_j,
~~~

solve them exactly, then test the candidate against every constraint.

Use:

~~~text
intersection
→ candidate
→ feasibility test
→ vertex/nonvertex classification
~~~

For larger models, programmatically enumerate or verify candidate intersections.

---

# 9. Use exact arithmetic before floating graphics

When coefficients are rational, prefer exact arithmetic for mathematical claims.

Julia example:

~~~julia
vstar_exact = (26//5, 8//1)
Z_exact(v) = 2*v[1] + 5*v[2]
@assert Z_exact(vstar_exact) == 252//5
~~~

Convert to floating-point only when required for rendering or numerical libraries.

~~~math
\boxed{
\text{exact mathematics}
\rightarrow
\text{floating computation/visualization}
}
~~~

Never reverse that relationship.

---

# 10. Determine activity, redundancy, and degeneracy

For every inequality, classify whether it is:

- inactive;
- active at a point;
- facet-defining;
- redundant;
- implied by other constraints.

Prove redundancy whenever it matters.

For standard-form LPs, connect geometry to basis structure:

~~~math
\boxed{
\text{extreme point}
\longleftrightarrow
\text{basic feasible solution}
}
~~~

If multiple bases produce the same BFS, identify degeneracy explicitly.

---

# 11. Determine boundedness and recession structure

For

~~~math
X=\{x:Ax\le b\},
~~~

use

~~~math
\operatorname{rec}(X)=\{d:Ad\le0\}.
~~~

A bounded polyhedron satisfies

~~~math
\operatorname{rec}(X)=\{0\}.
~~~

For unboundedness, exhibit a nonzero \(d\) such that

~~~math
x+\lambda d\in X
\qquad
\forall\lambda\ge0.
~~~

A clipped plotting window must never be treated as a mathematical boundary.

---

# 12. Analyze objective geometry

For a linear objective

~~~math
Z=c^\top x,
~~~

the level sets are

~~~math
c^\top x=k.
~~~

The gradient/objective vector is

~~~math
\boxed{c=\nabla Z}
~~~

and is normal to every level hyperplane.

For a tangent \(t\),

~~~math
\boxed{c^\top t=0.}
~~~

For maximization, improvement is in direction \(+c\); for minimization, in direction \(-c\).

Objective contours shown in a figure should have meaningful levels, preferably tied to important vertices or candidate solutions.

---

# 13. Prove optimality; do not merely identify an optimum

For small LPs, compare objective values at all extreme points.

Then seek a stronger certificate when appropriate:

- active-normal conic combination;
- dual feasible solution;
- complementary slackness;
- KKT conditions;
- convexity/global optimality arguments.

A result is stronger when it answers both:

~~~text
What is the optimum?
Why can no feasible point do better?
~~~

---

# 14. Translate mathematics into engineering meaning

For every decision variable and constraint, ask:

~~~math
\boxed{\text{What engineering mechanism does this object represent?}}
~~~

Examples:

~~~math
\sum_i x_i\le C
\rightarrow
\text{capacity},
\qquad
Ax=b
\rightarrow
\text{conservation/balance},
~~~

~~~math
x_i\le My_i
\rightarrow
\text{logical linkage},
\qquad
x_i\ge0
\rightarrow
\text{domain/physical restriction}.
~~~

Do not invent units or physical meaning if the source problem does not provide them. State the interpretation boundary explicitly.

---

# 15. Visual ontology

A scientific optimization figure uses visual grammar, not decorative styling.

| Mathematical role | Recommended visual grammar |
|---|---|
| complete constraint boundary | thin/faint |
| active feasible facet | thick/solid |
| redundant constraint | faint + dashed + direct label |
| feasible region | light transparent fill |
| vertex | point + coordinate |
| optimal vertex | stronger marker |
| hyperplane | strong line |
| half-space | light region fill |
| direction vector | arrow |
| recession direction | ray |
| recession cone | separate direction-space panel when useful |
| objective contour | parallel dashed line family |
| gradient \(c\) | arrow normal to contours |
| plot boundary | no mathematical visual meaning |

Use:

~~~math
\boxed{
\text{same object}
\Rightarrow
\text{same color + same direction + spatial proximity}
}
~~~

---

# 16. Use redundant visual encoding

Do not rely on color alone.

Prefer:

~~~math
\boxed{
\text{color}
+
\text{line style}
+
\text{thickness}
+
\text{marker}
+
\text{direct label}
}
~~~

A mature visual should remain interpretable in grayscale and under common color-vision differences.

Do not reuse one color for unrelated semantic roles.

---

# 17. Labels must be geometrically derived

For a line \(a^\top x=b\), choose an anchor \(p\) on the line and offset along the normal:

~~~math
\boxed{
p_{\mathrm{label}}
=
p+\varepsilon\frac{a}{\|a\|}
}
~~~

For a vector \(v\) starting at \(p\), place the label near an interior point and offset perpendicularly:

~~~math
\boxed{
m_{\mathrm{label}}
=
p+\alpha v
+
\varepsilon
\frac{(-v_2,v_1)}{\|v\|}
}
~~~

For direct ownership:

~~~math
\boxed{
\text{line-label rotation}=\text{line direction}
}
~~~

and

~~~math
\boxed{
\text{vector-label rotation}=\text{vector direction}.
}
~~~

Do not use manual coordinate guesswork when a label position can be derived geometrically.

---

# 18. Equal data scaling is mandatory for geometric claims

For 2-D mathematical geometry in CairoMakie:

~~~julia
aspect = DataAspect()
~~~

should be the default.

Without equal data scaling, slopes, perpendicularity, angles, and vector direction can be visually misleading even when the equations are correct.

---

# 19. Engineering graph-paper standard

Default when useful:

~~~math
\boxed{
\text{major grid}=1,
\qquad
\text{minor grid}=0.2.
}
~~~

Maintain the hierarchy:

~~~text
minor grid
< major grid
< fills
< axes
< mathematical boundaries
< critical annotations
~~~

The grid exists for verification, not decoration.

---

# 20. One panel should answer one mathematical question

Before creating a panel, write the question it answers.

Examples:

- What is the feasible set?
- Which constraints actually shape feasibility?
- In which directions can the system move indefinitely?
- Why is this vertex optimal?
- How do basic feasible solutions map to extreme points?

If a panel cannot answer a precise mathematical question, reconsider whether it belongs.

Separate spaces when their ontology differs, such as \(x\)-space and \(d\)-space.

---

# 21. Julia code architecture

For serious work, separate mathematical layers from plotting layers.

Recommended structure:

~~~julia
using CairoMakie
using LaTeXStrings
using LinearAlgebra

# 1. exact mathematical data
# 2. parameters / constants
# 3. mathematical functions
# 4. feasibility predicate
# 5. exact vertices / directions / bases
# 6. mathematical assertions
# 7. visual constants
# 8. figure and axes
# 9. fills
# 10. full constraint boundaries
# 11. active facets
# 12. points / vectors / contours
# 13. labels
# 14. final visual checks
# 15. export
~~~

When multiple problems are combined, isolate them in modules to prevent namespace collisions.

---

# 22. Define one feasibility predicate

Every computational representation should use a single source of truth.

Example:

~~~julia
function feasible(x; atol=1e-10)
    return (
        g1(x) <= atol &&
        g2(x) <= atol &&
        x[1] >= -atol &&
        x[2] >= -atol
    )
end
~~~

Use it for candidate vertices, recession-ray tests, solver results, and assertions.

---

# 23. Assertions are scientific gates

Assertions should verify mathematical claims that could be defended on paper.

Good examples:

~~~julia
@assert feasible(v)
@assert isapprox(dot(normal, tangent), 0.0; atol=1e-12)
@assert objective(xstar) == 252//5
@assert isapprox(A[i,:]' * xstar, b[i]; atol=1e-12)
~~~

For unbounded rays:

~~~julia
for λ in (0, 1, 10, 100)
    @assert feasible(x0 + λ*d)
end
~~~

Avoid assertions that only verify arbitrary plotting coordinates unless they encode a true mathematical claim.

~~~math
\boxed{
\text{If the code cannot verify a mathematical claim, the figure should not claim it.}
}
~~~

---

# 24. Solver role

For small homework problems:

~~~math
\boxed{\text{derive first, solver second}.}
~~~

Use JuMP/HiGHS or another solver as independent verification, not as a substitute for derivation.

For large models, solvers become operationally central, but the model, assumptions, units, and validation logic must still be understood before solver output is trusted.

---

# 25. Separate verification from validation

Verification asks:

~~~math
\boxed{\text{Did we solve/implement the equations correctly?}}
~~~

Validation asks:

~~~math
\boxed{\text{Do these equations represent the intended engineering problem?}}
~~~

An implementation can be numerically correct and still model the wrong real system.

---

# 26. Rendering is a separate gate

Code execution is not visual validation.

~~~math
\boxed{
\text{code PASS}
\neq
\text{figure PASS}.
}
~~~

Assertions can verify mathematics but cannot prove:

- labels do not collide;
- the hierarchy is readable;
- the page is not clipped;
- line styles are distinguishable;
- equations remain legible;
- the visual communicates the intended ontology.

The artifact audit cycle is:

~~~text
Julia
→ PDF
→ render PDF
→ inspect
→ correct
~~~

The exported PDF is the submission authority, not the interactive plotting window.

---

# 27. Determinism and reproducibility

Scientific code should render the same result repeatedly.

Prefer explicit:

- axis limits;
- ticks;
- colors;
- line styles;
- label anchors;
- package versions;
- output names.

Avoid uncontrolled randomness, arbitrary automatic colors, and non-deterministic placement.

For serious Julia work, use a project environment with Project.toml and Manifest.toml.

Once an assignment environment is working, freeze package versions until submission.

---

# 28. Error taxonomy

Classify failures before fixing them.

| Failure class | Meaning |
|---|---|
| Syntax error | Julia code is not parsable |
| Package/environment error | dependency missing or incompatible |
| API error | code uses an unsupported/changed interface |
| Mathematical assertion failure | derivation/model claim is inconsistent |
| Numerical failure | solver/tolerance/conditioning issue |
| Visual design failure | rendered artifact is misleading or unreadable |

An API error is not evidence that the mathematics is wrong.

A failing mathematical assertion is useful: it blocks incorrect output.

---

# 29. Configuration management and freezing

Once an artifact passes, do not casually edit it.

Use versioned validated names, for example:

~~~text
P4_LP_Geometry_Optimality_v1.0_VALIDATED.pdf
P4_LP_Geometry_Optimality_v1.0.jl
~~~

Keep the exact source that generated the validated artifact.

Any later edit reopens the relevant audit gates.

---

# 30. PASS gates

The top-level compatibility gates remain:

| Gate | Question |
|---|---|
| G1 Mathematical | Are formulation, derivations, classifications, and certificates correct? |
| G2 Geometric | Does the geometry exactly represent the mathematical objects and relationships? |
| G3 Engineering | Are mechanisms, assumptions, units, scope, and interpretation valid? |
| G4 Computational / Artifact | Do code, assertions, numerical checks, rendering, and reproducibility support the claims? |

G4 contains three mandatory subgates when applicable:

~~~text
G4a Computational verification
G4b Visual/rendered-artifact verification
G4c Reproducibility/configuration control
~~~

A full pass requires:

~~~math
\boxed{
\mathrm{FULL\ PASS}
=
G_1\land G_2\land G_3\land G_{4a}\land G_{4b}\land G_{4c}.
}
~~~

If a gate is genuinely not applicable, mark it N/A with a reason rather than silently skipping it.

---

# 31. Status vocabulary

Use only explicit states:

- FULL PASS — all applicable gates completed and passed;
- MATHEMATICAL PASS — mathematics passed but downstream gates remain;
- GEOMETRIC PASS — geometry verified but downstream gates remain;
- FIX REQUIRED — a known correction is needed;
- BLOCKED — missing information/tool/data prevents completion;
- N/A — a gate does not apply, with reason.

Never call something FULL PASS merely because code executed.

---

# 32. Default /op output

For each problem, return or build the following, omitting only genuinely irrelevant items:

1. exact question;
2. source/authority statement;
3. sets, indices, parameters, variables, domains, units;
4. assumptions and scope boundaries;
5. authoritative formulation;
6. normalized equivalent forms;
7. mathematical-object ontology;
8. active/inactive/redundant classification;
9. exact geometric derivation;
10. feasibility and boundedness analysis;
11. recession directions/cone when applicable;
12. objective geometry;
13. optimum;
14. optimality certificate;
15. standard-form / basis / BFS analysis when applicable;
16. engineering interpretation;
17. visual questions and panel architecture;
18. semantic visual grammar;
19. exact arithmetic plan;
20. computational implementation plan;
21. mathematical assertions;
22. solver verification when useful;
23. rendered-artifact audit;
24. reproducibility/environment audit;
25. gate table;
26. explicit final status.

---

# 33. Standard pre-code worksheet

Before coding, answer:

| Question | Required answer |
|---|---|
| Exact question? | what must be proved/computed/shown |
| Source authority? | statement/file/section defining the problem |
| Decision variables? | symbols, domains, units |
| Parameters? | values, units, source |
| Assumptions? | mathematical and engineering assumptions |
| Objective? | form + meaning |
| Constraints? | form + mechanism |
| Constraint type? | equality / inequality / bound / linkage |
| Geometric object? | hyperplane / half-space / polyhedron / cone / etc. |
| Active set? | derive |
| Redundant constraints? | prove |
| Vertices/intersections? | derive exactly |
| Bounded? | prove |
| Recession structure? | derive if relevant |
| Objective contours? | derive |
| Improvement direction? | derive |
| Optimum? | derive |
| Certificate? | extreme-point / normal cone / dual / KKT |
| Standard form/bases? | derive if required |
| Engineering meaning? | interpret without inventing unsupported units |
| Visual ontology? | define object-to-style mapping |
| Exact arithmetic? | identify rational/symbolic quantities |
| Assertions? | map claims to tests |
| Solver check? | independent verification |
| PDF audit? | inspect actual export |
| Reproducibility? | environment/version/output traceability |

---

# 34. Six-question engineering habit

For every important equation, ask:

~~~math
\boxed{
\begin{array}{ll}
1.&\text{What is defined?}\\
2.&\text{Why does it have this form?}\\
3.&\text{What geometry does it create?}\\
4.&\text{What engineering mechanism does it represent?}\\
5.&\text{How can it be verified?}\\
6.&\text{Where does its validity end?}
\end{array}}
~~~

---

# 35. Compact master standard

For all future optimization, sustainability, resilience, and thesis visualization work:

~~~text
QUESTION FIRST
↓
MATHEMATICS FIRST
↓
ONTOLOGY SECOND
↓
GEOMETRY THIRD
↓
ENGINEERING MEANING
↓
VISUAL DESIGN AFTER PROOF
↓
CODE WITH ASSERTIONS
↓
PDF BEFORE PASS
↓
FREEZE AFTER VALIDATION
~~~

The objective of /op is not merely to solve an exercise. It is to construct, interrogate, prove, interpret, compute, validate, and communicate an optimization model without allowing plotting or software to redefine the mathematics.
