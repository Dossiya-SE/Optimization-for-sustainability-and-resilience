# /op command

## Purpose

`/op` invokes the repository's canonical **Optimization Engineering Workflow**.

Canonical authority:

```text
/OP.md
```

## Syntax

```text
/op
/op <problem>
/op <exercise number>
/op <uploaded file or model>
/op here
```

## Required execution sequence

When `/op` is invoked, apply this sequence unless a mathematically necessary step is not applicable:

```text
FORMULATE
→ NORMALIZE
→ CLASSIFY
→ DERIVE
→ VERIFY
→ INTERPRET
→ VISUALIZE
→ COMPUTE
→ AUDIT
→ FREEZE
```

## Non-negotiable rules

1. Mathematics is the authority; never infer truth from a plot or solver output alone.
2. Separate parameters, decision variables, sets, objective, constraints, and indices.
3. Separate a constraint from its boundary and from any active feasible facet.
4. Derive intersections and vertices analytically before plotting.
5. Prove redundancy, boundedness/unboundedness, and recession structure when relevant.
6. For linear objectives, derive level sets, gradient, tangent direction, and improvement direction.
7. Derive an optimality certificate whenever the exercise permits one.
8. State the engineering meaning and units of variables, coefficients, objective, and constraints.
9. Use ontology-driven visual encoding: same mathematical object → same color, direction, and spatial association.
10. Put mathematical assertions into code before rendering.
11. Use solvers as independent verification when feasible; do not substitute solver output for derivation in small exercises.
12. Render and inspect figures before declaring PASS.

## PASS gates

```text
G1 Mathematical
G2 Geometric
G3 Engineering
G4 Computational / visual
```

A solution may be frozen only when:

```math
PASS = G_1 land G_2 land G_3 land G_4.
```

## Default output of /op

For each problem, return:

1. authoritative formulation;
2. symbol/variable/parameter audit;
3. normalized mathematical forms;
4. object ontology;
5. exact derivation;
6. feasibility / boundedness / redundancy analysis;
7. objective geometry;
8. optimum and certificate;
9. engineering interpretation;
10. visualization specification when useful;
11. Julia assertions / solver verification when useful;
12. four-gate audit;
13. explicit `PASS`, `BLOCKED`, or `FIX REQUIRED` state.

Never declare `FULL PASS` before the relevant calculations, code execution, and rendered visual audit have actually been completed.
