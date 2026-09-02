# 06 — Research-Gap Map

**Purpose:** connect evidence, limitations, research questions, methods, validation, and contribution.

```mermaid
flowchart TD
    LIT["Literature and Existing Practice"] --> SCI["Scientific Evidence"]
    LIT --> IND["Industrial Evidence"]

    SCI --> SLIM["Scientific Limitations"]
    IND --> ILIM["Industrial Limitations"]

    SLIM --> GAP["Research Gap"]
    ILIM --> GAP

    GAP --> RQ["Research Question"]
    RQ --> HYP["Hypothesis / Proposition"]
    HYP --> METH["Mathematical / Computational Method"]

    METH --> DATA["Data / Case Study"]
    DATA --> VAL["Verification and Validation"]
    METH --> VAL

    VAL --> RES["Results"]
    RES --> SC["Scientific Contribution"]
    RES --> IC["Engineering / Industrial Contribution"]

    SC --> LIM["Limitations and Future Research"]
    IC --> LIM
    LIM -. "new evidence cycle" .-> LIT
```

## Research logic

```math
\text{evidence}
\rightarrow
\text{limitation}
\rightarrow
\text{gap}
\rightarrow
\text{question}
\rightarrow
\text{method}
\rightarrow
\text{validation}
\rightarrow
\text{contribution}.
```

A rigorous gap must be supported by evidence; it should not be created merely because a method is mathematically interesting.
