# Stage 2 — Interdependency Mechanisms

**Framework stage:** Stage 2 — Causal Mechanisms  
**Status:** CANONICAL / FROZEN  
**Frozen:** 2026-09-11  
**Degree:** Master of Science in Engineering (MSE), Sustainable Engineering  
**Change rule:** Do not revise this Stage-2 scope unless explicitly requested and versioned.  
**Framework preservation rule:** This specification does **not** modify the canonical seven-stage framework. It formalizes the content of Stage 2 only.

## 1. Stage role

Stage 1 defines the system entities and subsystem boundary:

```math
\boxed{\{P,T,I,O\}}
```

Stage 2 defines how those subsystems causally affect one another:

```math
\boxed{ \text{Stage 1 defines }P,T,I,O \quad\Longrightarrow\quad \text{Stage 2 defines how }P,T,I,O\text{ causally affect one another} }
```

## 2. Complete interdependency scope

The complete directed interdependency set is:

```math
\boxed{ \mathcal I= \{ P\!\to\!T,T\!\to\!P, P\!\to\!I,I\!\to\!P, P\!\to\!O,O\!\to\!P, T\!\to\!I,I\!\to\!T, T\!\to\!O,O\!\to\!T, I\!\to\!O,O\!\to\!I \} }
```

Equivalently, Stage 2 contains six bidirectional interdependency families:

```math
\boxed{
P\leftrightarrow T,\quad
P\leftrightarrow I,\quad
P\leftrightarrow O,\quad
T\leftrightarrow I,\quad
T\leftrightarrow O,\quad
I\leftrightarrow O
}
```

The conceptual Stage-2 structure is therefore broader than a single physical Power–Transportation coupling interface.

## 3. Interdependency families and measurable effects

| Direction | Interdependencies in scope | Main measurable effect |
|---|---|---|
| `P→T` | EV/eBus charging, traffic signals, station power, metro/MRT/LRT traction power, railway traction power | mobility capacity, train operation, charging availability |
| `T→P` | repair-crew accessibility, equipment logistics, EV/V2G, regenerative braking, transport-dependent restoration | repair time, power restoration, grid injection/load |
| `P→I` | electricity supply to sensors, communication equipment, control centres, SCADA/ITS/rail control | information availability |
| `I→P` | measurements, SCADA, state estimation, protection information, DER/charging/traction control | observability, control accuracy, response delay |
| `P→O` | outage severity, damaged assets, critical-service loss, restoration requirements | organizational workload and resource demand |
| `O→P` | switching, repair sequencing, crew allocation, DER dispatch, load restoration | power-state and recovery trajectory |
| `T→I` | traffic states, accessibility, EV SOC, bus telemetry, train position/speed, service status | transport situational awareness |
| `I→T` | V2X, traffic control, routing, fleet control, CBTC, ATP, ATO, ATS | mobility operation and safety |
| `T→O` | congestion, blocked roads, inaccessible assets, rail disruption, logistics constraints | feasible response actions |
| `O→T` | road management, rerouting, dispatch, rail scheduling, emergency routing | transport-state/recovery trajectory |
| `I→O` | estimated state, alarms, forecasts, damage information, confidence, information freshness | decision quality and decision time |
| `O→I` | monitoring priorities, reporting rules, information sharing, communication priorities, access authority | information availability and flow |

## 4. Conceptual representation

The previous narrow representation

```math
P\leftrightarrow T
```

is insufficient for the actual thesis scope. Stage 2 is conceptually represented by

```math
\boxed{ \begin{array}{ccc} P & \leftrightarrow & T\\ \updownarrow && \updownarrow\\ I & \leftrightarrow & O \end{array} }
```

plus the diagonal couplings

```math
\boxed{ P\leftrightarrow O, \qquad T\leftrightarrow I. }
```

Thus the formal Stage-2 representation uses all six bidirectional families rather than only the physical `P–T` interface.

## 5. Subsystem-level decomposition

For each directed family, the interdependency set is decomposed to subsystem/component level. For example:

```math
\boxed{ \mathcal I^{P\rightarrow T} = \bigcup_{p\in P} \bigcup_{t\in T} \mathcal I_{pt}^{P\rightarrow T} }
```

An edge is included only when a real causal mechanism exists.

Illustrative mechanisms include:

```math
P_D\rightarrow P_C\rightarrow T_R
```

for EV charging,

```math
P_D\rightarrow P_C\rightarrow T_B
```

for electric-bus charging,

```math
P_{Tr/D}\rightarrow P_{TP}\rightarrow T_U
```

for Metro/MRT traction,

```math
P_{Tr}\rightarrow P_{TP}\rightarrow T_H
```

for heavy/intercity rail, and

```math
T_R\rightarrow O_L\rightarrow P_D
```

for road accessibility affecting power repair.

The same subsystem-to-subsystem decomposition is to be developed for all 12 directed relationships.

## 6. Canonical interdependency object

Every accepted interdependency is represented by

```math
\boxed{ \mathfrak I_{ij}^{\alpha\beta} = \left( E_i^\alpha, E_j^\beta, M_{ij}, w_{ij}, \delta_{ij}, \tau_{ij}, a_{ij}, m, \mathcal H_t \right) }
```

with subsystem indices

```math
\alpha,\beta\in\{P,T,I,O\},\qquad \alpha\neq\beta.
```

Therefore an arrow alone is insufficient. Every accepted interdependency must identify:

```math
\boxed{ \text{Source} \rightarrow \text{Mechanism} \rightarrow \text{Receiver} \rightarrow \text{Effect} }
```

and characterize:

- `E_i^α`: source entity/component,
- `E_j^β`: receiving entity/component,
- `M_{ij}`: causal transmission mechanism,
- `w_{ij}`: interdependency strength,
- `δ_{ij}`: delay,
- `τ_{ij}`: characteristic timescale,
- `a_{ij}`: activation state/condition,
- `m`: system operating mode,
- `\mathcal H_t`: relevant system/event history.

## 7. Causal admissibility rule

Simple correlation, co-occurrence, co-location, or common hazard exposure does **not** constitute an interdependency.

```math
\boxed{ \text{same flood affects }P\text{ and }T \;\not\Rightarrow\; P\leftrightarrow T }
```

An accepted interdependency requires a causal transmission mechanism:

```math
\boxed{ \alpha \xrightarrow{M_{ij}} \beta. }
```

This distinction prevents common-cause exposure from being misclassified as cross-system causal dependence.

## 8. Position inside the seven-stage framework

The frozen hierarchy is:

```math
\boxed{ \underbrace{\{P,T,I,O\}}_{\text{Stage 1: system}} \rightarrow \underbrace{\mathcal I^{\alpha\beta}}_{\text{Stage 2: interdependencies}} \rightarrow \underbrace{F(Y,\ldots)}_{\text{Stage 3: dynamics}} \rightarrow \underbrace{I\rightarrow O\rightarrow u}_{\text{Stage 4}} \rightarrow \underbrace{\mathcal V_{\mathrm{sus}}^u}_{\text{Stage 5}} \rightarrow \underbrace{\text{Stages 6--7}}_{\text{transition and transformation}} }
```

Stage 2 therefore has a bounded scientific responsibility:

> **Identify, classify, parameterize, and evidence the causal interdependencies among `P`, `T`, `I`, and `O`; do not yet solve their full coupled dynamics.**

## 9. Freeze statement

This document is the canonical Stage-2 scope for the thesis. The seven-stage framework remains unchanged. Future Stage-2 diagrams, evidence tables, subsystem matrices, equations, simulations, and thesis text must remain consistent with this specification unless an explicit revision is requested.