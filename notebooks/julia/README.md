# Julia Verification

Julia is used after a mathematical model has been derived explicitly.

Preferred workflow:

```math
\text{derive}\rightarrow\text{implement}\rightarrow\text{verify}\rightarrow\text{interpret}.
```

The current `smoke_test.jl` checks dimensions, nonnegativity, resource use, and slack for a generic resource-allocation instance.
