# 08 — Cross-Domain Knowledge Graph

**Purpose:** show reusable mathematical ideas that connect multiple optimization and infrastructure domains.

```mermaid
flowchart TD
    FB["Flow Balance"]
    CAP["Capacity Constraint"]
    OBJ["Objective Function"]
    UNC["Uncertainty"]
    NET["Network Structure"]

    FB --> PROD["Production Systems"]
    FB --> EN["Energy Balance"]
    FB --> WA["Water Mass Balance"]
    FB --> TF["Transportation Flow Conservation"]

    CAP --> RA["Resource Allocation"]
    CAP --> GEN["Generation Limits"]
    CAP --> PUMP["Pump / Treatment Capacity"]
    CAP --> ROAD["Transport Capacity"]

    NET --> NF["Network Flow"]
    NET --> COUP["Interdependent Infrastructure"]
    NET --> REST["Restoration Networks"]

    OBJ --> COST["Cost"]
    OBJ --> EM["Emissions"]
    OBJ --> SL["Service Loss"]
    OBJ --> RT["Recovery Time"]

    UNC --> ROB["Robust Optimization"]
    UNC --> STO["Stochastic Optimization"]
    UNC --> RES["Resilience Analysis"]

    NF --> COUP
    ROB --> COUP
    EM --> SUS["Sustainability Optimization"]
    SL --> RES
    RT --> RES
    SUS --> DEC["Engineering Decision"]
    RES --> DEC
    COUP --> DEC
```

## Why this graph matters

The same mathematical primitive can appear in several engineering contexts. For example,

```math
\text{flow balance}
```

is not specific to one sector; it is a transferable conservation structure that reappears in production, energy, water, and transportation models.
