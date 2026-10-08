# IEE 574 — New Mathematical Skills Learned from Homework 3

**Course:** IEE 574 — Applied Deterministic Operations Research  
**Topic:** Basis decomposition, reduced costs, the primal Simplex method, and optimization certificates

Homework 3 marks an important transition: from understanding the geometry of linear programming to understanding how the Simplex method works mathematically.

- **Homework 1:** Formulate optimization problems from decision variables, objectives, and constraints.
- **Homework 2:** Study feasible regions, extreme points, bases, basic feasible solutions, and optimality.
- **Homework 3:** Move systematically between basic feasible solutions, identify improving directions, and decide whether a linear program has a finite optimum or is unbounded.

> This public note records reusable mathematical skills and reasoning methods, not the worked answers to graded homework questions.

## 1. The nine main skills

| New skill | What we learn to do | Problem |
|---|---|---|
| 1. Basis decomposition | Separate the constraint matrix into basic and nonbasic columns, \(B\) and \(N\) | P1 |
| 2. Basic solution construction | Calculate \(x_B=B^{-1}b\), with \(x_N=0\) | P1 |
| 3. Feasibility verification | Distinguish a basic solution from a basic feasible solution | P1 |
| 4. Feasible direction construction | Determine how basic variables change when a nonbasic variable increases | P1 |
| 5. Reduced-cost analysis | Measure whether changing a nonbasic variable can improve the objective | P1 |
| 6. Simplex pivot decisions | Select entering and leaving variables using reduced costs and a ratio test | P2–P3 |
| 7. Unboundedness certification | Prove that an objective decreases indefinitely along a feasible ray | P2 |
| 8. Finite optimality certification | Establish that no improving nonbasic direction remains at a feasible basis | P3 |
| 9. Parametric tableau analysis | Determine how feasibility, optimality, and pivot decisions depend on unknown parameters | P4 |

## 2. The most important mathematical connections

### A. From a basis to a basic feasible solution

Given the standard-form linear program

$$
\min\;c^\top x
\quad\text{subject to}\quad
Ax=b,\qquad x\ge 0,
$$

partition the columns of \(A\) into \(B\) and \(N\):

$$
Bx_B+Nx_N=b.
$$

Setting the nonbasic variables to zero gives

$$
\boxed{x_B=B^{-1}b,\qquad x_N=0.}
$$

This construction requires a nonsingular basis matrix \(B\). A **basic solution is not automatically feasible**: we must also check

$$
B^{-1}b\ge 0.
$$

### B. From a nonbasic variable to a search direction

For a nonbasic variable \(x_j\), increase its value by a step \(t\ge 0\), keeping the other nonbasic variables fixed. Feasibility of the equality system requires

$$
Ad^{(j)}=0.
$$

Choose the nonbasic components of the direction to be \(d_N^{(j)}=e_j\). The basic components must then satisfy

$$
Bd_B^{(j)}+A_j=0,
$$

so

$$
\boxed{d_B^{(j)}=-B^{-1}A_j.}
$$

The objective change per unit step is

$$
\begin{aligned}
c^\top d^{(j)}
&=c_j+c_B^\top d_B^{(j)}\\
&=c_j-c_B^\top B^{-1}A_j\\
&=\boxed{\bar c_j}.
\end{aligned}
$$

Thus

$$
\boxed{c^\top d^{(j)}=\bar c_j.}
$$

For a **minimization** problem, \(\bar c_j<0\) indicates a decreasing objective along the associated direction, provided a **strictly positive feasible step** exists.

### C. From an improving direction to a Simplex decision

The primal Simplex method combines two decisions:

1. **Entering variable:** select a nonbasic variable with negative reduced cost for minimization.
2. **Leaving variable:** determine how far the entering variable can increase without violating nonnegativity of the current basic variables.

Write

$$
u=B^{-1}A_j,\qquad x_B(t)=x_B-tu.
$$

If some components of \(u\) are positive, the allowable step is

$$
t^*=\min_{i:u_i>0}\frac{(x_B)_i}{u_i}.
$$

The minimum-ratio test identifies the limiting basic variable. Ties can produce more than one eligible leaving variable, and zero steps can occur under degeneracy.

If \(u\le 0\) componentwise, then \(x_B(t)\ge0\) for every \(t\ge0\). With a negative reduced cost, this certifies **unboundedness below**.

## 3. What each problem adds to our mathematical ability

### Problem 1 — Understand the algebra underlying Simplex

We learn why the basis matrix, basic solution, feasible search direction, and reduced cost are connected. Instead of memorizing the reduced-cost formula, we derive the identity

$$
c^\top d^{(j)}=c_j-c_B^\top B^{-1}A_j.
$$

We then check the equality constraints and nonnegativity conditions separately.

### Problem 2 — Recognize and prove unboundedness

A negative reduced cost alone does **not** establish unboundedness. We must exhibit a feasible point \(x^0\) and a direction \(d\) such that

$$
Ad=0,\qquad d\ge0,\qquad c^\top d<0.
$$

Then, for every \(t\ge0\),

$$
x(t)=x^0+td
$$

remains feasible, and

$$
c^\top x(t)=c^\top x^0+t\,c^\top d\longrightarrow-\infty.
$$

This is a mathematical certificate of unboundedness, not merely a numerical solver message.

### Problem 3 — Reach and certify a finite optimum

We learn to introduce surplus variables when transforming inequalities into standard form, start from a prescribed feasible basis, perform the necessary pivots, and check the final reduced costs.

For a minimization LP in standard form, a feasible basis with

$$
\bar c_j\ge0\qquad\text{for every nonbasic }j
$$

certifies global optimality. We must explain why these inequalities rule out any objective improvement.

### Problem 4 — Reason under unknown parameter values

A parametric Simplex tableau requires symbolic reasoning:

- **Feasibility:** inspect the basic right-hand-side values.
- **Entering variable:** examine reduced-cost signs under the tableau's stated sign convention.
- **Leaving variable:** examine positive pivot-column entries and compare feasible step ratios.
- **Unboundedness:** distinguish a direction certificate from conditions that merely indicate a potentially improving variable.
- **Uniqueness:** use strict conditions when the question requires the *only* entering or leaving variable.

An important lesson is to check whether parameters not named in a question still affect the complete characterization, and to distinguish **sufficient** from **necessary-and-sufficient** conditions.

## 4. Our progression across the three homeworks

| Homework | Main theme | Mathematical foundation |
|---|---|---|
| 1 — Mathematical formulation | Decision variables, objectives, constraints, notation | Express an engineering question as an optimization model |
| 2 — Geometry and foundations | Feasible sets, extreme points, basic solutions, optimality | Understand the structure of linear programs |
| 3 — Optimization algorithms | Reduced costs, directions, pivots, stopping certificates | Explain and execute the primal Simplex method |

The progression is

$$
\boxed{
\text{Formulate}
\;\longrightarrow\;
\text{Understand the feasible set}
\;\longrightarrow\;
\text{Optimize and certify}.
}
$$

## 5. Homework 3 exam-readiness checklist

Check each skill only when it can be demonstrated **without consulting an existing solution**.

- [ ] Construct \(B\) and \(N\) correctly from any specified basis.
- [ ] Calculate a basic solution and verify its feasibility.
- [ ] Derive a nonbasic search direction without memorizing the answer.
- [ ] Prove that a reduced cost equals the objective change along its direction.
- [ ] Carry out a Simplex iteration and justify the entering and leaving variables.
- [ ] Prove unboundedness using a feasible ray.
- [ ] Establish optimality using final reduced costs.
- [ ] Determine symbolic conditions for feasibility and unique pivots.

**Self-test:** change the numerical data in a practice LP and reproduce every step with exact arithmetic before checking the result computationally.

## 6. The single most valuable new ability

Homework 3 teaches us to distinguish three outcomes of primal Simplex reasoning:

1. **Continue improving:** a feasible improving pivot is available.
2. **Certify optimality:** the current basic solution is feasible and all nonbasic reduced costs are nonnegative in the minimization convention.
3. **Certify unboundedness:** a feasible improving ray decreases the objective indefinitely.

$$
\boxed{
\text{Basic feasible solution}
\;\longrightarrow\;
\text{Reduced costs and feasible directions}
\;\longrightarrow\;
\begin{cases}
\text{Improve},\\
\text{Certify optimality},\\
\text{Certify unboundedness}.
\end{cases}
}
$$

**Next learning goal:** reproduce these decisions independently, without relying on a solver or an existing solution. The objective is to understand both the Simplex algorithm and the mathematical justification for each of its conclusions.

---

**Related course notes:** [IEE 574 course index](../README.md) · [Modeling and reasoning protocol](modeling-reasoning-protocol.md) · [Topics 1–6 foundations](topics-1-6-authoritative-framework.md)
