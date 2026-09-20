# Optimization for Sustainability and Resilience

A developing mathematical and computational repository for **optimization of sustainable and resilient engineering systems**.

## Program identity and nomenclature

This thesis research is conducted within the **Master of Science in Engineering (MSE) in Sustainable Engineering** program.

**Canonical degree abbreviation:** MSE  
**Canonical expansion:** Master of Science in Engineering

For this ASU thesis and all related framework, modeling, presentation, and validation materials, use **MSE** exclusively.

See PROJECT_IDENTITY.md for the canonical project identity.

The repository is organized around one intellectual progression:

~~~mermaid
flowchart LR
    A[Linear Algebra] --> B[Mathematical Modeling]
    B --> C[LP / MILP]
    C --> D[Network Optimization]
    D --> E[Sustainability]
    E --> F[Resilience]
~~~

and one engineering workflow:

~~~mermaid
flowchart LR
    P[Physical system] --> D[Decision variables]
    D --> C[Constraints]
    C --> O[Objective]
    O --> S[Optimization]
    S --> I[Intervention / policy]
~~~

## Canonical resilience-to-sustainability framework

The current authoritative Power–Transportation–Information–Organization framework is maintained in 04-resilience/FINAL_FRAMEWORK.md.

~~~text
1. Multilayer Structure
→ 2. Causal Mechanisms
→ 3. Coupled Hybrid Multiscale Dynamics
→ 4. Feedback & Control
→ 5. Viability
→ 6. Resilience-to-Sustainability Transformation Interface
→ 7. Sustainable Transformation Pathways
~~~

Stages 1–5 are the core resilience-analysis framework. Stages 6–7 translate resilience findings into sustainable-transformation requirements and pathways without altering the resilience model itself.

## Mathematical viewpoint

A generic optimization model has the form

~~~math
\begin{aligned}
\min_{x\in\mathcal X}\quad & f(x)\\
\text{s.t.}\quad
& g_i(x)\le b_i,\qquad i\in[m],\\
& h_j(x)=0,\qquad j\in[p].
\end{aligned}
~~~

The same structure can represent cost, emissions, service loss, recovery time, robustness, or resilience.

## Repository map

| Area | Purpose |
|---|---|
| 01-foundations/ | Linear algebra, notation, modeling, LP foundations |
| 02-models/ | Reusable optimization model families |
| 03-sustainability/ | Environmental, economic, and social objectives |
| 04-resilience/ | Service loss, recovery, robustness, interdependence |
| 05-case-studies/ | Power, water, transport, and coupled systems |
| coursework/IEE574/ | Course-aligned learning notes without publishing an answer key |
| figures/ | TikZ and mathematical visualization assets |
| notebooks/ | Julia and Python computational verification |
| mindmaps/ | Xmind-importable Markdown maps |
| docs/visual-architectures/ | GitHub-native Mermaid research maps and systems diagrams |
| references/ | Reading lists and bibliography |
| tools/openai-platform/ | Optional future AI-assisted research workflow notes |

## Modeling standard

Every model should declare, in this order:

1. Sets and indices
2. Parameters / input data
3. Decision variables
4. Objective
5. Constraints
6. Variable domains
7. Units and interpretation
8. Verification checks

This mirrors:

~~~math
\text{data}\rightarrow\text{decisions}\rightarrow\text{rules}\rightarrow\text{goal}.
~~~

## Mathematical writing standard

- Every index is either summed over or explicitly quantified.
- Parameters and decision variables are never mixed conceptually.
- Every constraint receives an interpretation when supported by the source problem.
- Dimensional consistency is checked whenever units are present.

## Academic integrity

This is a public repository. During an active course, graded homework solutions should not be published before submission or when prohibited by course policy. The coursework/ directory therefore stores study structure, notation, and reusable principles rather than a public answer key.

---

## /op — Optimization Engineering Workflow v2.0

Use:

~~~text
/op
/op here
/op <problem or exercise>
~~~

Canonical authority: OP.md

~~~text
QUESTION → FORMULATE → NORMALIZE → CLASSIFY → DERIVE
→ VERIFY → CERTIFY → INTERPRET → DESIGN
→ COMPUTE/CODE → ASSERT → RENDER → AUDIT → FREEZE
~~~

Version 2.0 adds:

- exact arithmetic before floating graphics;
- explicit separation of model, feasible-set, objective, and display geometry;
- active/redundant/facet ontology;
- standard-form, basis, BFS, and degeneracy analysis when relevant;
- semantic color plus line-style/marker redundancy;
- mathematically derived label placement;
- claim-aligned Julia assertions;
- verification-versus-validation separation;
- deterministic environments and package freezing;
- error taxonomy;
- PDF-as-authority visual validation;
- versioned artifact/source freezing.

A result is frozen only after the applicable Mathematical, Geometric, Engineering, Computational, Rendered-Artifact, and Reproducibility checks pass.

## Status

**Degree:** Master of Science in Engineering (MSE), Sustainable Engineering.  
**Phase 1:** deterministic operations-research foundations.  
**Current research framework:** seven-stage P–T–I–O resilience-to-sustainability architecture.  
**Next:** network flow, sustainability objectives, resilience metrics, coupled infrastructure models, and computational validation.
