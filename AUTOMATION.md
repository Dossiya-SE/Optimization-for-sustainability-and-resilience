# Automation Architecture

The repository automation is split into three layers.

## 1. Deterministic checks — active

- repository-quality workflow,
- Julia mathematical smoke tests,
- LaTeX/TikZ compilation.

These checks do not require external credentials.

## 2. AI-assisted mathematical audit — prepared, credential pending

Planned checks include undefined symbols, dangling indices, parameter/variable confusion, missing domains, unit inconsistencies, model disconnects, and equation/prose mismatches.

This layer must use an `OPENAI_API_KEY` stored only as a GitHub Actions repository secret. The key must never be committed.

## 3. Knowledge architecture — active

The master research map is maintained in Xmind and mirrored in `mindmaps/optimization-for-sustainability-and-resilience.md`.

## Quality gate

The target development cycle is

```math
\text{derive}\rightarrow\text{document}\rightarrow\text{visualize}\rightarrow\text{compute}\rightarrow\text{verify}\rightarrow\text{review}\rightarrow\text{merge}.
```

For research-critical models, no AI-generated audit replaces analytical derivation or numerical verification.
