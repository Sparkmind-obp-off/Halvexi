# Data Model and Events

## Core entities
Workspace; User/Role; Channel; AffiliateProgram; Product; Evidence; DemandSignal; ProductEvaluation; ContentConcept; ContentVersion; Claim; Approval; Publication; TrackingLink; MetricSnapshot; Experiment; Conversion; Commission/Payout; AgentRun; AuditEvent.

## Required fields and rules
- Product: canonical URL, merchant, title, category, variant, observed price/time.
- Affiliate program: terms URL, region, eligibility requirements, commission rules, attribution window, payout rules, verification time.
- Evidence: source URL/type, captured time, excerpt, claim supported, freshness, confidence.
- Evaluation: score version, component scores, unknowns, hard stops, decision, reviewer.
- Content: product/channel, hypothesis, script/assets, rights status, version/status.
- Claim: exact wording, evidence IDs, approval status, risk.
- Publication: post ID/URL, channel, content version, timestamp, tracking method.
- Metric: name, value/unit, source, time window, observed/imported time, confidence.
- Agent run: agent/provider, input/output refs, status, latency, retries, cost where available.
- Audit: actor, action, target, version, timestamp, reason, correlation ID.

Store money as decimal-safe amounts plus ISO currency code. Use UTC timestamps and local-time display. Missing is null/unknown, not zero. Distinguish observed, program-reported, estimated, and hypothesis. Preserve raw exports where lawful and normalize separately. Avoid collecting buyer personal data unless necessary and authorized.

## Event taxonomy
product_candidate_created; evidence_attached; eligibility_verified; evaluation_completed; brief_generated; claim_flagged; content_approved; publication_recorded; metric_imported; conversion_reported; commission_adjusted; experiment_closed; agent_run_failed; budget_limit_reached; workflow_paused.

Define retention, export, deletion, and access controls before production.