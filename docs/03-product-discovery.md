# Physical Product Discovery and Scoring

## Evidence hierarchy
Prefer official affiliate terms, official merchant pages, and first-party analytics; then public marketplace pages and public conversations; then third-party estimates with limitations. AI-generated ideas are hypotheses until supported. Views, likes, rankings, and comments are not proof of sales unless the source defines them as such.

## Candidate fields
Canonical product URL, merchant, title, category, variant, observed price/time, shipping/returns where known, stock status/time, program eligibility, commission terms, attribution window, payout rules, audience/problem hypothesis, source excerpts, review themes and sample limits, demonstration feasibility, category risk, confidence, freshness, and unknowns.

## Explainable score (initial hypothesis)
- Audience/problem evidence: 20
- Affiliate economics: 20
- Demonstrability: 15
- Creative differentiation: 15
- Purchase friction: 10
- Program/platform eligibility: 10
- Evidence quality/freshness: 10

This prioritizes research; it does not predict sales. Display each component and missing inputs.

## Hard stops
Suspected counterfeit, unsafe or prohibited product, unverifiable key claim, unconfirmed eligibility, or inability to make truthful content. A score cannot override a hard stop.

## Economics
For percentage commission, gross commission per attributed order is observed product price multiplied by confirmed commission rate, subject to program rules. For fixed commission, use the confirmed fixed amount. Do not assume both. Net commission requires known refund/cancellation adjustments and attributable costs. If inputs are missing, show insufficient data rather than false precision.

## Workflow
Collect → timestamp → deduplicate → extract facts → summarize demand signals with sample limitations → verify program eligibility → score → human decision → refresh volatile fields before approval.