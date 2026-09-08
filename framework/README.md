# Canonical 7-Stage P-T-I-O Framework — Design Package

**Canonical date:** 2026-09-09  
**Status:** authoritative until explicitly changed.

## Architecture

1. Multilayer Structure — **What exists?**
2. Causal Mechanisms — **Why does disruption propagate?**
3. Coupled Hybrid Multiscale Dynamics — **How and when does it evolve?**
4. Feedback & Control — **How does the system respond?**
5. Viability — **Can it survive?**
6. Resilience-to-Sustainability Transformation Interface — **What do the resilience results imply for sustainability?**
7. Sustainable Transformation Pathways — **What should be changed for long-term sustainability?**

Stages 1–5 are the resilience-analysis core. Stages 6–7 are downstream sustainability translation/transformation. Sustainability does not redefine the resilience core.

## Mathematical backbone

```text
(G, Y, Z) -> C -> (Z, F, J, tau) -> (H_obs, Y_hat, I, O, pi, u) -> (K, V) -> R -> T_ST -> S
```

## Design rationale benchmark

The visual architecture was adapted from systems-engineering principles rather than copied from a generic infographic:

- **NIST CPS Framework**: uses reference architectures and cross-cutting concerns including functional, human, timing, data, boundaries, composition, lifecycle, and trustworthiness. This supports the P-T-I-O layering and treating timing as a first-order property.
- **NIST Timing Annex**: supports explicit timing/latency treatment in cyber-physical systems, motivating Stage 3 as a combined hybrid + multiscale engine.
- **NASA Systems Engineering Handbook**: emphasizes logical decomposition, roles, relationships, dependencies, interfaces, interface management, and verification/validation. This supports explicit interface representation, directed functional flow, and a separate viability/verification gate.

Primary references:
- https://doi.org/10.6028/NIST.SP.1500-201
- https://doi.org/10.6028/NIST.SP.1500-203
- https://www.nasa.gov/reference/systems-engineering-handbook/

## Files

- `architecture.mmd` — Mermaid logical skeleton
- `architecture.dot` — Graphviz systems architecture
- `framework.tex` — publication-grade TikZ/LaTeX figure
- `validate_framework.py` — deterministic structural validation
- `validation_report.json` — validation results

## Validation invariants

The validation script enforces:

- exactly 7 canonical stages;
- stages 1–5 = resilience core;
- stages 6–7 = sustainability extension;
- strictly ordered 1→2→3→4→5→6→7 flow;
- 4 P-T-I-O layers imply 12 directed cross-layer dependencies;
- sustainability translation occurs only after viability;
- transformation is downstream of the translation interface.
