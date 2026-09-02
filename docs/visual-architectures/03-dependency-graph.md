# 03 — Mathematical Dependency Graph

**Purpose:** show prerequisite relationships among the mathematical and optimization topics.

```mermaid
flowchart TD
    ALG["Linear Algebra"] --> NOT["Indexed Notation"]
    ALG --> CVX["Convexity"]
    NOT --> MOD["Mathematical Modeling"]
    CVX --> LPG["LP Geometry"]
    MOD --> LP["Linear Programming"]
    LPG --> LP

    LP --> DUAL["Duality / Sensitivity"]
    LP --> MILP["Mixed-Integer Programming"]
    LP --> NF["Network Flow"]

    GT["Graph Theory"] --> NF
    NF --> TRANS["Transportation / Flow Models"]
    NF --> INF["Infrastructure Network Models"]

    LP --> MO["Multi-objective Optimization"]
    LP --> ROB["Robust Optimization"]
    MILP --> REST["Restoration Scheduling"]
    ROB --> RES["Resilience Optimization"]
    INF --> RES
    REST --> RES

    SUSM["Sustainability Metrics"] --> MO
    MO --> SUSOPT["Sustainability Optimization"]
    RES --> COUPLED["Coupled Infrastructure Optimization"]
    SUSOPT --> COUPLED
```

## Interpretation

An arrow

```math
A\rightarrow B
```

means that understanding or implementing $B$ substantially depends on concepts developed in $A$. This is a learning and model-development dependency graph, not a claim that each topic has only one prerequisite.
