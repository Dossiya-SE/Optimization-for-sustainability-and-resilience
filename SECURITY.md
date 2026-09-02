# Security

## Credentials

Never commit API keys, passwords, access tokens, private keys, or `.env` files.

For automation that requires credentials, use GitHub Actions repository secrets.

## OpenAI integration

The planned mathematical-audit workflow should read `OPENAI_API_KEY` only from GitHub Actions secrets. No raw key should appear in source code, documentation, workflow logs, issues, or pull requests.

## Public-coursework caution

Because the repository is public, do not commit restricted course materials or graded solution keys when redistribution or publication is not permitted.
