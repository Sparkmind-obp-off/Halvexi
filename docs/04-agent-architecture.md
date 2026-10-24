# Agent Architecture

Use a bounded workflow of specialized agents, not an unconstrained swarm. The database is the source of truth. Every agent has typed outputs, permitted tools, timeout, retry limit, cost ceiling, and escalation path.

## Roles
1. Scout: gather permitted public evidence or process user-provided links/exports.
2. Evidence Analyst: deduplicate, separate fact from inference, flag stale/conflicting sources.
3. Product Evaluator: verify program terms, economics, category risk, missing data, and hard stops.
4. Creative Strategist: produce differentiated concepts and test hypotheses from approved evidence.
5. Script Planner: draft script, shot list, on-screen text, caption, disclosure, and CTA.
6. Claim Reviewer: compare claims to sources and flag platform/category risks; may block release.
7. Performance Analyst: normalize reported metrics, identify limitations, and propose next tests.
8. Orchestrator: route tasks, enforce state transitions, log costs, pause on errors or limits.

## State machine
Idea → Evidence gathering → Candidate scored → Eligibility review → Brief approved → Draft ready → Compliance review → Human approved → Published → Measurement open → Analyzed → Archived. Any state can be blocked or rejected with a reason. Edits after approval create a new version and require re-review.

## Permissions
Research agents are read-only. Creative agents draft but cannot publish. Publishing is not enabled by default and requires verified official authorization and explicit human approval. Generative agents never receive passwords, OTPs, session cookies, or unrestricted account credentials.

## Guardrails
Validate structured output; treat scraped text as untrusted data and prompt injection as non-instructional; use idempotency keys; limit retries and costs; preserve provenance; log actions; enforce a global pause switch; do not allow an agent to override policy blocks or approval gates.