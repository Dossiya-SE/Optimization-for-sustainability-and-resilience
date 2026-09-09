# Coupled Power–Transportation Resilience States — Visual Framework Archive

**Status:** reusable visual archive for the thesis framework  
**Created:** 2026-09-09  
**Repository location:** `04-resilience/visual-frameworks/coupled-power-transportation-resilience-states/`

This folder preserves the visual language used to communicate the viability-based resilience concept for coupled Power–Transportation systems.

## Canonical mathematical interpretation

The formal quantity is the **signed viability margin**

$$
\rho_{\mathcal V}^{\pm}(Y),
$$

not `Pv`, `²v`, or an ordinary performance score.

- $\rho_{\mathcal V}>0$: state is **inside the viable region**.
- $\rho_{\mathcal V}=0$: state is **on the critical viability boundary** $\partial\mathcal V$.
- $\rho_{\mathcal V}<0$: state is **outside the viable region** under the admissible controls and disturbance set used by the model.

The resilience-state labels are a **communication layer** around the formal viability geometry. They should not be interpreted as separate mathematical theorems unless each regime is explicitly defined in the model.

## Visual state sequence

`Sustain → Adapt → Absorb → Recover → Viable → Critical Boundary → Overload → Degrade → Cascade → Collapse`

The color logic is traffic-light based:

- **Green:** resilient / sustainable viable regime.
- **Amber:** viability margin is small and approaches the boundary.
- **Red:** non-viable / cascade-failure regime.

## Reusable files

- [`poster-a3.svg`](poster-a3.svg) — editable vector A3 portrait version.
- [`generate_poster.py`](generate_poster.py) — deterministic source for regenerating the SVG.
- [`DESIGN_SPEC.md`](DESIGN_SPEC.md) — text, notation, colors and scientific meaning.
- [`CANVA.md`](CANVA.md) — editable Canva version and design ID.
- [`manifest.json`](manifest.json) — hashes/dimensions of raster iterations from this design session.

## Canva editable design

- Edit: https://www.canva.com/d/X6hXhoWuSp81WOb
- View: https://www.canva.com/d/V6mkH4JVp7FbDpE

The Canva design was saved after correction of the viability notation.

## Relation to the canonical 7-stage thesis framework

This visual primarily communicates **Stage 5 — Viability**, while connecting upstream disruption/dynamics and downstream resilience-to-sustainability interpretation:

$$
\text{Multilayer Structure}
\to\text{Causal Mechanisms}
\to\text{Coupled Hybrid Multiscale Dynamics}
\to\text{Feedback \& Control}
\to\boxed{\text{Viability}}
\to\text{Resilience-to-Sustainability Transformation Interface}
\to\text{Sustainable Transformation Pathways}.
$$
