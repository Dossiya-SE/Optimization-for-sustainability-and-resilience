# 04 — Systems Engineering Architecture

**Purpose:** represent the full engineering loop from the physical system to intervention and validation.

```mermaid
flowchart LR
    PS["Physical Infrastructure"] --> OBS["Observation / Data"]
    PS --> PHY["Physical Laws and Limits"]

    OBS --> EST["State / Parameter Estimation"]
    PHY --> MAT["Mathematical Representation"]
    EST --> MAT

    MAT --> VAR["Decision Variables"]
    MAT --> CON["Constraints"]
    MAT --> OBJ["Objective Functions"]

    VAR --> OPT["Optimization Model"]
    CON --> OPT
    OBJ --> OPT

    OPT --> SOL["Solver / Algorithm"]
    SOL --> DEC["Engineering Decision"]
    DEC --> INT["Design / Operation / Restoration Intervention"]
    INT --> PS

    PS --> PERF["Measured Performance"]
    PERF --> VAL["Model Validation"]
    VAL -->|calibrate / revise| EST
    VAL -->|revise assumptions| MAT
```

## Core mathematical object

```math
\begin{aligned}
\min_{x\in\mathcal X}\quad & f(x;\theta)\\
\text{s.t.}\quad & g(x;\theta)\le 0,\\
& h(x;\theta)=0,
\end{aligned}
```

where $x$ denotes decisions and $\theta$ represents physical, economic, environmental, or operational parameters inferred from the system.

This diagram answers: **How does a real engineering system become an auditable optimization decision?**
