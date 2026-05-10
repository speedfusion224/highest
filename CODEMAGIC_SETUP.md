# Codemagic Build Setup

This project now includes a Codemagic workflow for building the web app.

## What is configured

- `codemagic.yaml` defines a `build-web` workflow
- It installs dependencies and runs `npm run build`
- It saves built artifacts from `dist/**/*`

## How to use

1. Connect your repository to Codemagic:
   - https://codemagic.io
   - Add your GitHub repository

2. Ensure the workflow file is in the repository root:
   - `codemagic.yaml`

3. In Codemagic, select the `build-web` workflow.

4. Trigger the build.

## Injecting API keys

This workflow includes placeholders for Supabase, Paystack, and Apple credentials directly in `codemagic.yaml`.

- `SUPABASE_URL`
- `SUPABASE_ANON_KEY`
- `SUPABASE_SERVICE_KEY`
- `PAYSTACK_PUBLIC_KEY`
- `PAYSTACK_SECRET_KEY`
- `PAYSTACK_BASE_URL`
- `APPLE_API_KEY_ID`
- `APPLE_API_KEY_ISSUER_ID`
- `APPLE_API_KEY_PATH`
- `APPLE_API_KEY_P8`
- `APPLE_TEAM_ID`
- `APPLE_ID`

If you want to avoid manual environment setup entirely, replace the placeholder values in `codemagic.yaml` with your real keys and Apple private key contents.

> Note: Embedding secret values directly in repository files is not secure. Prefer Codemagic UI encrypted environment variables if possible.

## Notes

- This workflow currently builds the web assets only.
- There is no native iOS app project in this repository yet.
- If you want a TestFlight/iOS build, you must add an iOS wrapper (for example a Capacitor or native Xcode project) first.

## Files created

- `codemagic.yaml` - Codemagic build configuration
- `CODEMAGIC_SETUP.md` - setup instructions

## Optional next step

If you want, I can also add a Capacitor wrapper or Xcode project files so Codemagic can produce an iOS archive / IPA for TestFlight.
