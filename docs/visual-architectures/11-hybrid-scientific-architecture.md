# 11 — Hybrid Scientific Architecture

**Purpose:** integrate mathematics, physical systems, optimization, sustainability, resilience, and engineering intervention into one research architecture.

```mermaid
flowchart TD
    subgraph L1["Layer 1 — Physical Systems"]
        P1["Power"]
        P2["Water"]
        P3["Transportation"]
        P4["Cross-sector Interfaces"]
        P1 --- P4
        P2 --- P4
        P3 --- P4
    end

    subgraph L2["Layer 2 — Mathematical Representation"]
        M1["State / Decision Vectors"]
        M2["Graphs and Networks"]
        M3["Balance Laws"]
        M4["Feasible Sets"]
    end

    subgraph L3["Layer 3 — Optimization Theory"]
        O1["LP / MILP"]
        O2["Network Optimization"]
        O3["Multi-objective Optimization"]
        O4["Robust / Stochastic Optimization"]
    end

    subgraph L4["Layer 4 — Sustainability Objectives"]
        S1["Economic Performance"]
        S2["Environmental Burden"]
        S3["Social / Service Performance"]
    end

    subgraph L5["Layer 5 — Resilience Mechanisms"]
        R1["Robustness"]
        R2["Service Loss"]
        R3["Recovery"]
        R4["Interdependency Effects"]
    end

    subgraph L6["Layer 6 — Engineering Decisions"]
        D1["Design"]
        D2["Operation"]
        D3["Restoration"]
        D4["Planning / Policy"]
    end

    P4 --> M2
    P1 --> M3
    P2 --> M3
    P3 --> M2

    M1 --> O1
    M2 --> O2
    M3 --> O1
    M4 --> O1

    O1 --> O3
    O2 --> O3
    O1 --> O4

    S1 --> O3
    S2 --> O3
    S3 --> O3

    R1 --> O4
    R2 --> O3
    R3 --> O1
    R4 --> O2

    O3 --> D1
    O3 --> D2
    O4 --> D3
    O2 --> D4

    D1 -. "changes topology / capacity" .-> P4
    D2 -. "changes operation" .-> P1
    D2 -. "changes operation" .-> P2
    D3 -. "restores service" .-> P4
    D4 -. "changes planning rules" .-> L1
```

## Formal interpretation

Let

```math
x\in\mathcal X
```

denote engineering decisions, $\theta$ physical and operational parameters, and $\omega$ uncertain disturbances. A generic coupled formulation is

```math
\begin{aligned}
\min_{x\in\mathcal X}\quad
& \Big(C(x),\ E(x),\ L(x,\omega)\Big)\\
\text{s.t.}\quad
& F_P(x,\theta,\omega)=0,\\
& F_W(x,\theta,\omega)=0,\\
& F_T(x,\theta,\omega)=0,\\
& H_{PWT}(x,\theta,\omega)\le 0,
\end{aligned}
```

where $F_P,F_W,F_T$ represent sector-specific physical or operational constraints and $H_{PWT}$ represents cross-sector coupling constraints.

The architecture is intentionally cyclic:

```math
\text{physical system}
\rightarrow
\text{model}
\rightarrow
\text{optimization}
\rightarrow
\text{intervention}
\rightarrow
\text{changed physical system}.
```

This is the master scientific systems map for the repository.
