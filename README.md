# HALVEXI — Agentic Affiliate Intelligence

> **Product definition:** an evidence-led operating system for discovering physical products, producing affiliate content, running controlled distribution experiments, and learning from measured outcomes.

**Domain:** https://halvexi.biz.id (user-reported; deployment not verified)  
**Repository:** https://github.com/Sparkmind-obp-off/Halvexi  
**Initial market:** Indonesia  
**Initial channel hypothesis:** TikTok / TikTok Shop affiliate, subject to account and program eligibility  
**Current milestone:** MVP operator-console scaffold; browser-local prototype, not production deployment.

## Run locally

Requirements: Node.js 20+ and npm.

```bash
npm install
npm run dev
```

Production build and type-check:

```bash
npm run build
npm run typecheck
```

## Current working modules

- **Overview:** candidate, evidence, content and manually entered measurement totals.
- **Product Lab:** capture a physical-product candidate and score evidence readiness using explicit criteria.
- **Evidence Ledger:** attach source URL, note, source type, confidence and observation date to a product.
- **Content Studio:** generate three differentiated starter concepts, script outlines and affiliate disclosure draft; mark a specific draft approved for manual production.
- **Experiments:** manually record views, clicks, orders and commission from real sources.
- **Guardrails:** explain what is and is not connected.

## Important implementation limits

- This first prototype stores records in browser `localStorage` on the current browser/device. It is not multi-user, server-backed, or a safe central database.
- D1 schema is drafted in `migrations/0001_initial.sql`, but no D1 binding or API is connected yet.
- No AI provider, product-research provider, TikTok account, affiliate program, or publishing integration is connected.
- Approving a draft is an internal status only. It does not publish content or verify its claims.
- The readiness score is a deterministic checklist, not a prediction of sales or profitability.
- Domain, DNS, deployment, production security, affiliate eligibility and legal/trademark clearance are not verified.

## Product principle

HALVEXI is not a bot farm or a promise of passive income. It is a human-supervised workflow: **Evidence → Product candidate → Eligibility & economics → Content draft → Human review → Permitted publication → Measure → Learn.** Unknown values remain unknown. No invented demand, sales, commission, product tests, testimonials or performance results.

## Roadmap

1. Validate the browser workflow with one physical product and three differentiated concepts.
2. Implement authenticated API + D1 persistence, migrations, audit trail and export.
3. Add evidence-backed product research adapters after checking access rules, source quality and costs.
4. Add provider-agnostic agent workflows with usage limits and human review.
5. Consider publishing/analytics integrations only where official authorization and platform eligibility are verified.

## Documentation

See [docs/](docs/) for product vision, MVP scope, discovery scoring, agent design, content production, channel operations, data model, compliance, measurement, technical architecture, roadmap, runbook, agent prompts, test worksheet, launch checklist and decision log.
