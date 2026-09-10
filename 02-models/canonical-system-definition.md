# Canonical System Definition

**Status:** CANONICAL THESIS DEFINITION  
**Adopted:** 2026-09-11  
**Scope:** Multilayer interdependent infrastructure resilience and sustainability research.  
**Change rule:** Use this system description throughout the thesis unless it is explicitly revised and versioned.

---

## 1. Canonical system class

We study a

$$
\boxed{\text{Multilayer interdependent infrastructure system}}
$$

with

$$
\boxed{P,T=\text{physical infrastructure systems}}
$$

and

$$
\boxed{I,O=\text{informational and organizational layers}}.
$$

The most precise thesis description is:

> **A multilayer physical informational organizational interdependent Power Transportation infrastructure system.**

---

## 2. Layer interpretation

Let

$$
\mathcal L=\{P,T,I,O\}.
$$

The four layers have distinct roles:

- $P$: Power infrastructure system.
- $T$: Transportation infrastructure system.
- $I$: Information layer, including sensing, communication, estimation, data availability, information quality, and latency.
- $O$: Organizational layer, including authority, coordination, decision-making, resource mobilization, workforce, and intervention capability.

The physical state may be represented as

$$
X(t)=\begin{bmatrix}x_P(t)\\x_T(t)\end{bmatrix},
$$

and the informational-organizational state as

$$
Z(t)=\begin{bmatrix}I(t)\\O(t)\end{bmatrix}.
$$

The integrated system state is therefore

$$
\boxed{
Y(t)=
\begin{bmatrix}
x_P(t)\\
x_T(t)\\
I(t)\\
O(t)
\end{bmatrix}
}.
$$

---

## 3. Thesis modeling discipline

The thesis must not reduce the system to a purely physical Power-Transportation network when information and organizational mechanisms materially affect observation, coordination, control, failure propagation, recovery, or viability.

Accordingly,

$$
\boxed{R_{\mathrm{system}}\neq R(P,T)}
$$

in the general case considered here. The working representation is instead

$$
\boxed{R_{\mathrm{system}}=R(P,T,I,O,\mathbb I)},
$$

where $\mathbb I$ denotes the set of explicitly characterized interdependency objects.

This system definition therefore provides the system-level basis for the canonical interdependency object

$$
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
\right),
$$

with

$$
\alpha,\beta\in\{P,T,I,O\}.
$$

---

## 4. Canonical thesis statement

> **The research studies a multilayer interdependent Power-Transportation infrastructure system in which Power and Transportation form the physical infrastructure systems, while Information and Organization form interacting informational and organizational layers that shape observation, coordination, control, propagation, recovery, viability, and sustainable transformation.**

This description is the default system identity for the thesis, presentations, literature extraction, mathematical modeling, simulation, validation, and framework design unless explicitly changed.
