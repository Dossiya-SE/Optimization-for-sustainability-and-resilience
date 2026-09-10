# Canonical Interdependency Object

**Status:** CANONICAL THESIS DEFINITION  
**Adopted:** 2026-09-10  
**Scope:** Multilayer interdependent infrastructure systems; physical–information–organizational resilience; power–transportation core case.  
**Change rule:** Use this definition throughout the thesis unless it is explicitly revised and versioned.

---

## 1. Canonical definition

For an entity \(E_i^\alpha\) in layer \(\alpha\) interacting with an entity \(E_j^\beta\) in layer \(\beta\), define the interdependency object

$$
\boxed{
\mathfrak I_{ij}^{\alpha\beta}
=
\left(
E_i^\alpha,
E_j^\beta,
M_{ij},
w_{ij},
\delta_{ij},
\tau_{ij},
a_{ij},
m,
\mathcal H_t
\right)
}
$$

with

$$
\begin{aligned}
E_i^\alpha,E_j^\beta &: \text{participating entities},\\
M_{ij} &: \text{causal mechanism},\\
w_{ij} &: \text{interdependency strength},\\
\delta_{ij} &: \text{interaction/propagation delay},\\
\tau_{ij} &: \text{characteristic timescale},\\
a_{ij} &: \text{activation state},\\
m &: \text{system operating mode},\\
\mathcal H_t &: \text{relevant history up to time }t.
\end{aligned}
$$

The thesis-level interpretation is

$$
\boxed{
\text{Interdependency}
=
\text{entities}
+
\text{relation}
+
\text{mechanism}
+
\text{state}
+
\text{time}
+
\text{context}
}
$$

This explicitly rejects the reduced interpretation

$$
A_{ij}=1 \quad \Longrightarrow \quad \text{complete representation of interdependency}.
$$

An adjacency relation records that a connection exists; \(\mathfrak I_{ij}^{\alpha\beta}\) records how that connection can actually affect system evolution.

---

## 2. Semantic decomposition

### Entities

\(E_i^\alpha\) and \(E_j^\beta\) identify the source and target participants in the interaction. Layers may include, at minimum,

$$
\alpha,\beta \in \{P,T,I,O\},
$$

where

- \(P\): power infrastructure,
- \(T\): transportation infrastructure,
- \(I\): information/control infrastructure,
- \(O\): organizational/institutional infrastructure.

The same formalism applies to intra-layer \((\alpha=\beta)\) and inter-layer \((\alpha\neq\beta)\) interactions.

### Causal mechanism

\(M_{ij}\) specifies the physical, informational, control, organizational, geographic, logical, economic, or other mechanism by which a change in \(E_i^\alpha\) can influence \(E_j^\beta\).

This term answers the causal question

$$
\boxed{\text{Why and through what mechanism can }E_i^\alpha\text{ change }E_j^\beta?}
$$

### Strength

\(w_{ij}\) quantifies the magnitude or gain of the dependency when such quantification is meaningful. In general it may be state- and mode-dependent:

$$
w_{ij}=w_{ij}(Y,t,m,\mathcal H_t).
$$

### Delay

\(\delta_{ij}\) represents the lag between a change at the source and its effective influence at the target:

$$
E_i^\alpha(t-\delta_{ij}) \rightarrow E_j^\beta(t).
$$

### Timescale

\(\tau_{ij}\) represents the characteristic temporal scale of the mechanism. It distinguishes interactions that may operate over milliseconds, seconds, minutes, hours, days, or longer recovery/organizational horizons.

Delay and timescale are not interchangeable:

$$
\boxed{\delta_{ij}=\text{when influence arrives},\qquad \tau_{ij}=\text{how fast the mechanism evolves}.}
$$

### Activation state

\(a_{ij}\) determines whether the interaction is currently active, inactive, degraded, conditional, or partially available. A minimal binary form is

$$
a_{ij}(t)\in\{0,1\},
$$

while more general implementations may use

$$
a_{ij}(t)\in[0,1]
$$

or a finite-state variable.

### System mode

\(m\) represents the current hybrid operating regime, for example

$$
m\in\{\text{normal},\text{stressed},\text{failed},\text{islanded},\text{emergency},\text{recovery}\}.
$$

The same pair of entities may therefore interact differently under different operating modes.

### History

\(\mathcal H_t\) captures path dependence, accumulated degradation, previous failures, restoration actions, control actions, organizational decisions, and other history-dependent effects:

$$
\mathcal H_t=\{Y(s),u(s),\eta(s),m(s):0\le s\le t\}.
$$

This permits non-Markovian and memory-dependent infrastructure behavior when required.

---

## 3. Relation to the multilayer graph

Let the multilayer infrastructure graph be

$$
\mathcal G=(\mathcal V,\mathcal E,\mathcal L),
$$

with layer set \(\mathcal L\). A graph edge

$$
e_{ij}^{\alpha\beta}\in\mathcal E
$$

identifies a potential relation, while the corresponding interdependency object

$$
\mathfrak I_{ij}^{\alpha\beta}
$$

provides its causal and dynamical semantics.

Hence

$$
\boxed{
\mathcal G_{\mathrm{structural}}
\xrightarrow{\;\mathfrak I\;}
\mathcal G_{\mathrm{causal/dynamical}}
}
$$

and the complete interdependency set is

$$
\mathbb I
=
\left\{
\mathfrak I_{ij}^{\alpha\beta}:
E_i^\alpha\in V_\alpha,
E_j^\beta\in V_\beta
\right\}.
$$

---

## 4. Role in the thesis framework

This object connects the first three stages of the canonical thesis architecture:

$$
\boxed{
\text{Multilayer Structure}
\rightarrow
\text{Causal Mechanisms}
\rightarrow
\text{Coupled Hybrid Multiscale Dynamics}
}
$$

Specifically:

1. **Multilayer Structure** identifies \(E_i^\alpha,E_j^\beta\) and candidate relations.
2. **Causal Mechanisms** specifies \(M_{ij},w_{ij},\delta_{ij},\tau_{ij}\).
3. **Hybrid/Multiscale Dynamics** evolves \(a_{ij},m,\mathcal H_t\) jointly with infrastructure states.

The resulting system dynamics may be written abstractly as

$$
\dot Y(t)
=
F_{\mathcal G}
\left(
Y(t),u(t),\eta(t);\theta,\mathbb I(t)
\right),
$$

or, when explicit delay/history dependence is needed,

$$
\dot Y(t)
=
F
\left(
Y(t),Y(t-\delta),u(t),\eta(t),m(t),\mathcal H_t;\mathbb I
\right).
$$

Thus the interdependency object is not only descriptive metadata; it is intended to parameterize the coupled state evolution.

---

## 5. Thesis discipline

Throughout the thesis, a claimed interdependency should be considered adequately specified only when the following questions are answered as far as the evidence permits:

1. **Who/what interacts?** \(E_i^\alpha,E_j^\beta\)
2. **By what causal mechanism?** \(M_{ij}\)
3. **With what magnitude?** \(w_{ij}\)
4. **After what delay?** \(\delta_{ij}\)
5. **On what characteristic timescale?** \(\tau_{ij}\)
6. **Under what activation condition?** \(a_{ij}\)
7. **In which operating regime?** \(m\)
8. **With what path/history dependence?** \(\mathcal H_t\)

Unknown quantities should be marked as unknown, estimated, assumed, calibrated, or empirically identified rather than silently omitted.

---

## 6. Canonical statement

> **Interdependency is a stateful, time-dependent causal relation between entities across or within infrastructure layers. Its effect depends not only on connectivity, but also on mechanism, strength, delay, timescale, activation, operating mode, and system history.**

This statement and the object \(\mathfrak I_{ij}^{\alpha\beta}\) are the default basis for all subsequent modeling, literature extraction, causal classification, coupled dynamics, failure propagation, recovery, control, viability, and resilience analysis in this thesis.
