# /op command — v2.0

## Purpose

/op invokes the repository's canonical Optimization Engineering Workflow v2.0 in /OP.md.

## Syntax

~~~text
/op
/op here
/op <problem>
/op <exercise number>
/op <model, file, or question>
~~~

## Required execution sequence

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

Skip a stage only when it is genuinely not applicable, and mark it N/A with a reason.

## Non-negotiable rules

1. Mathematics is the authority; never infer truth from a plot or solver alone.
2. Preserve the source formulation and derive equivalent forms separately.
3. Separate model geometry, feasible-set geometry, objective geometry, and display geometry.
4. Separate a constraint, its equality boundary, active status, and facet-defining status.
5. Use exact arithmetic before floating-point rendering when possible.
6. Derive intersections/vertices analytically and verify them against every constraint.
7. Prove redundancy, boundedness/unboundedness, recession structure, and degeneracy when relevant.
8. For objectives, derive level sets, gradient, tangent relation, improvement direction, and a certificate of optimality when possible.
9. Do not invent physical units or engineering semantics absent from the source.
10. Use semantic visual encoding; do not rely on color alone.
11. Derive label placement geometrically when possible.
12. Use equal data scaling for geometric claims.
13. Use one feasibility predicate as computational authority.
14. Assertions must correspond to defensible mathematical claims.
15. For small exercises, derive first and use solvers second.
16. Separate verification from validation.
17. Code execution is not figure validation.
18. The final exported PDF is the visual authority.
19. Keep outputs deterministic and environments reproducible.
20. Classify failures as syntax, package, API, mathematical, numerical, or visual before fixing them.
21. Freeze validated outputs with versioned source/artifact pairs.

## PASS gates

~~~text
G1  Mathematical
G2  Geometric
G3  Engineering
G4a Computational verification
G4b Rendered-artifact verification
G4c Reproducibility/configuration
~~~

~~~math
\mathrm{FULL\ PASS}
=
G_1\land G_2\land G_3\land G_{4a}\land G_{4b}\land G_{4c}.
~~~

## Status vocabulary

Use:

- FULL PASS
- MATHEMATICAL PASS
- GEOMETRIC PASS
- FIX REQUIRED
- BLOCKED
- N/A with reason

Never declare FULL PASS before the relevant calculations, code execution, PDF rendering, visual inspection, and reproducibility checks have actually been completed.

## Default /op output

For the current problem, produce:

1. exact question and source authority;
2. variables/parameters/domains/units/assumptions;
3. formulation and normalized forms;
4. ontology and active/redundant classification;
5. exact derivations;
6. boundedness/recession analysis when relevant;
7. objective geometry;
8. optimum and certificate;
9. standard-form/basis/BFS analysis when relevant;
10. engineering interpretation;
11. visual/panel architecture when useful;
12. exact arithmetic and computational plan;
13. assertions;
14. independent solver check when useful;
15. PDF/render audit;
16. reproducibility audit;
17. gate table;
18. explicit final state.

Canonical authority: /OP.md.
