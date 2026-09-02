# OpenAI-Assisted Mathematical Audit

This integration is intentionally separated from the deterministic repository checks.

## Intended audit scope

An AI-assisted review may check for:

- undefined mathematical symbols,
- inconsistent or dangling indices,
- parameter/decision-variable confusion,
- missing variable domains,
- dimensional inconsistencies,
- objectives disconnected from decisions,
- constraints disconnected from decisions,
- mismatches between prose, equations, and figures,
- unclear conservation or balance logic.

## Design principle

AI review is a secondary audit, not a mathematical proof. Deterministic tests, derivations, dimensional checks, and human verification remain authoritative.

## Credential rule

Never commit an OpenAI API key to this repository. Store credentials only in GitHub Actions repository secrets. The repository `.gitignore` excludes common local secret files.

## Planned automation

Once the `OPENAI_API_KEY` GitHub Actions secret is configured, add a pull-request workflow that sends selected mathematical documentation to the OpenAI Responses API and stores the returned audit as a workflow artifact. Use a cost-sensitive current model by default and keep the model name configurable through an environment variable.
