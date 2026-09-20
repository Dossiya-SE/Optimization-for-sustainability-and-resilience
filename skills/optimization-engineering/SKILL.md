# Optimization Engineering — /op v2.0

## Trigger

When the user types /op, /op here, or /op <problem>, apply the canonical workflow in /OP.md.

## Mission

Solve and communicate optimization problems by integrating:

- exact formulation;
- mathematical ontology;
- analytical geometry;
- optimization certificates;
- engineering interpretation;
- computational verification;
- controlled scientific visualization;
- reproducible artifact validation.

## Core pipeline

~~~text
QUESTION → FORMULATE → NORMALIZE → CLASSIFY → DERIVE
→ VERIFY → CERTIFY → INTERPRET → DESIGN
→ COMPUTE/CODE → ASSERT → RENDER → AUDIT → FREEZE
~~~

## Required behavior

- Preserve source authority; do not silently replace the original model.
- Use exact arithmetic where practical before floating computation.
- Distinguish model, feasible-set, objective, and display geometry.
- Classify active, inactive, redundant, and facet-defining constraints.
- Derive and verify vertices, rays, cones, contours, normals, and tangents as applicable.
- Connect extreme points to BFS/basis structure when standard-form algebra is part of the problem.
- Do not invent unsupported engineering units or mechanisms.
- Treat visual design as ontology encoding, not decoration.
- Do not rely on color alone.
- Use mathematically derived label placement when feasible.
- Encode paper-defensible claims as assertions.
- Use solvers as verification for small exercises, not as substitutes for derivation.
- Treat PDF/render inspection as distinct from code execution.
- Keep results deterministic and preserve environment/version traceability.
- Freeze only after all applicable gates pass.

## Gates

- G1 Mathematical
- G2 Geometric
- G3 Engineering
- G4a Computational
- G4b Rendered artifact
- G4c Reproducibility/configuration

## Final states

- FULL PASS
- MATHEMATICAL PASS
- GEOMETRIC PASS
- FIX REQUIRED
- BLOCKED
- N/A with reason

## Authority

The complete definitions, visual grammar, Julia architecture, assertion policy, error taxonomy, checklist, and freeze rules are maintained in /OP.md. Do not abbreviate away requirements that materially affect correctness.
