# Design Specification — Coupled Power–Transportation Resilience States

## Page

- Format: **A3 portrait**
- Physical size: **297 × 420 mm**
- Aspect ratio: **1 : 1.4142**
- Background: white
- Design intent: publication/poster-quality scientific infographic

## Exact text hierarchy

### Header

**Coupled Power-Transportation Resilience States**

`FROM RESILIENCE TO CASCADING FAILURE`

### Resilience-state sequence

1. **Sustain** — Maintain critical services (power & transportation)
2. **Adapt** — Adjust operations and topology
3. **Absorb** — Withstand disturbances
4. **Recover** — Restore functionality
5. **Viable** — Operate within acceptable limits
6. **Critical Boundary** — At the edge of viability
7. **Overload** — Exceed capacity limits
8. **Degrade** — Performance deterioration
9. **Cascade** — Propagate failures across systems
10. **Collapse** — System failure and loss of critical services

### Left-side conceptual labels

**ASSETS** — `Build / Adapt / Recover / Thrive`

**Viability Region**

**LIABILITIES** — `Degrade / Lose / Cascade / Fail`

### Right-side mathematical labels

**Resilient-Sustainable Regime**

$\rho_{\mathcal V}>0$ — Inside viable region

$\rho_{\mathcal V}=0$ — On critical boundary

**Cascade / Failure Regime**

$\rho_{\mathcal V}<0$ — Outside viable region

## Scientific notation

The full mathematical symbol is

$$
\boxed{\rho_{\mathcal V}^{\pm}(Y)}
$$

where $\mathcal V$ is the viability kernel/viable set used in the thesis model.

The poster may use the compact display `ρᵥ` only for legibility. It must **never** be rendered as `Pv` or `²v`.

Formal interpretation:

$$
\rho_{\mathcal V}^{\pm}(Y)=
\begin{cases}
+d(Y,\partial\mathcal V),&Y\in\mathcal V,\\
0,&Y\in\partial\mathcal V,\\
-d(Y,\partial\mathcal V),&Y\notin\mathcal V.
\end{cases}
$$

## Color system

| Regime | Role | Recommended hex |
|---|---|---|
| Green | viable / resilient-sustainable | `#058A2A`, `#19B83B`, `#8ED600` |
| Amber | near-boundary / viability warning | `#F2B705`, `#FF8A00`, `#8A4B00` |
| Red | non-viable / failure cascade | `#E10600`, `#B40000`, `#6F0000` |
| Navy | title / scientific text | `#07153A` |
| White | background / reverse text | `#FFFFFF` |

## Rigor rules

1. Keep **viability** distinct from stability, recoverability and cascading unless those states are formally defined.
2. The visual is a communication mapping; the formal classification is $Y\in\operatorname{int}\mathcal V$, $Y\in\partial\mathcal V$, $Y\notin\mathcal V$.
3. Use the signed margin only after $\mathcal V$ and its metric/distance definition are fixed.
4. Do not imply that every green sub-state is a separate viability class.
5. Preserve the thesis separation: resilience is analyzed in Stages 1–5; sustainability is informed through Stages 6–7.
