# Technical Architecture Proposal

## Constraints
Start with Rp0; verify current free tiers and limits. Do not require GitHub Actions. Keep provider integrations replaceable. Build only after the workflow and data fields are validated. This repository currently contains documentation, not a verified running application.

## Proposed baseline
- Frontend: TypeScript + React responsive operator console.
- API: TypeScript with Hono or equivalent lightweight framework.
- Hosting: Cloudflare Pages/Workers if compatible with required runtime and current account limits.
- Database: Cloudflare D1 with migrations for early operational records.
- Assets: R2 or approved storage only after validating quotas and privacy needs.
- Jobs: persisted queue/state machine and scheduled/queued Workers where available.
- AI: provider-agnostic adapter; check free tier, cost, data policy, and availability before selection.
- Research: permitted public sources and official APIs; external research providers are optional adapters.
- Analytics: manual entry/import first.
- Secrets: secure provider bindings; never expose secrets to the browser or commit to git.

## Logical flow
Operator console → API/orchestrator → workflow state machine → agents/adapters → evidence/content services → database and audit/cost events. Approved content goes through human publication; permitted analytics feed measurement ingestion.

## Future API outline
POST /products/candidates; GET /products/candidates; POST /products/{id}/evaluate; POST /content/briefs; POST /content/{id}/review; POST /content/{id}/approve; POST /publications/record; POST /metrics/import; GET /experiments/{id}/report; POST /workflows/pause.

All writes require authentication, authorization, schema validation, rate limits, and audit events. Approval must bind to the exact version.

## Reliability and security
Idempotent jobs, bounded retries/backoff, provider cost ceilings, circuit breakers, source freshness, deterministic scoring, secure sessions, CSRF protection where applicable, CSP, input validation, sanitized external content, audit logs, secret rotation, backup/export, and pause switch. Never store platform passwords or session cookies.