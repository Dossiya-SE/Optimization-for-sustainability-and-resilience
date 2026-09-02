# 02 — Concept Map

**Purpose:** show how mathematical, optimization, sustainability, resilience, and infrastructure concepts relate to one another.

```mermaid
flowchart LR
    LA["Linear Algebra"] -->|supports| LP["Linear Programming"]
    GT["Graph Theory"] -->|represents| NF["Network Flow"]
    LP -->|formulates| NF
    CVX["Convexity"] -->|explains feasible sets| LP

    NF -->|models| INF["Infrastructure Networks"]
    INF -->|contains| POW["Power"]
    INF -->|contains| WAT["Water"]
    INF -->|contains| TRN["Transportation"]

    BAL["Flow Balance"] -->|governs| NF
    BAL -->|appears in| POW
    BAL -->|appears in| WAT
    BAL -->|appears in| TRN

    SUS["Sustainability Metrics"] -->|modify objective / constraints| MO["Multi-objective Optimization"]
    RES["Resilience Metrics"] -->|modify objective / constraints| MO
    NF -->|provides system model for| MO

    HAZ["Hazards / Disruptions"] -->|change capacities and states| RES
    RES -->|motivates| REC["Recovery Optimization"]
    REC -->|selects| INT["Engineering Intervention"]
    MO -->|selects| INT

    INT -->|changes design / operation| INF
```

## Key conceptual relation

```math
\text{physical system}
\longrightarrow
\text{mathematical abstraction}
\longrightarrow
\text{optimization model}
\longrightarrow
\text{decision}.
```

Unlike a hierarchy, this representation deliberately permits cross-links and feedback.
