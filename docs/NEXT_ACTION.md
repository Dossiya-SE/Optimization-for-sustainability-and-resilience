# Next One-Time Action

The repository's deterministic automation is already configured. The only credential-dependent enhancement left is the OpenAI-assisted mathematical audit.

## Required one-time setup

Create an OpenAI Platform project API key and add it to this repository's GitHub Actions secrets with the exact name:

`OPENAI_API_KEY`

Do not put the raw key in source code, Markdown, issues, pull requests, workflow logs, or `.env` files committed to Git.

After that secret exists, the AI-assisted audit workflow can be enabled to review notation, indices, parameter/variable separation, domains, units, model connectivity, and equation/prose consistency.
