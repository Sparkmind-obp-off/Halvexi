-- HALVEXI initial schema. Apply only when the D1-backed API is implemented.
-- No customer data is migrated from browser localStorage by this migration.
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS product_candidates (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  category TEXT,
  source_url TEXT,
  price_idr INTEGER,
  commission_terms TEXT,
  problem_statement TEXT,
  target_audience TEXT,
  affiliate_eligibility TEXT NOT NULL DEFAULT 'UNKNOWN'
    CHECK (affiliate_eligibility IN ('UNKNOWN','ELIGIBLE','NOT_ELIGIBLE')),
  sample_status TEXT NOT NULL DEFAULT 'UNKNOWN'
    CHECK (sample_status IN ('UNKNOWN','AVAILABLE','UNAVAILABLE')),
  status TEXT NOT NULL DEFAULT 'RESEARCH'
    CHECK (status IN ('RESEARCH','READY_TO_TEST','HOLD')),
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS evidence_records (
  id TEXT PRIMARY KEY,
  product_id TEXT NOT NULL REFERENCES product_candidates(id) ON DELETE CASCADE,
  source_url TEXT NOT NULL,
  source_type TEXT NOT NULL,
  observation TEXT NOT NULL DEFAULT '',
  confidence TEXT NOT NULL DEFAULT 'MEDIUM'
    CHECK (confidence IN ('LOW','MEDIUM','HIGH')),
  observed_at TEXT NOT NULL,
  created_at TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_evidence_product ON evidence_records(product_id, observed_at DESC);

CREATE TABLE IF NOT EXISTS content_drafts (
  id TEXT PRIMARY KEY,
  product_id TEXT NOT NULL REFERENCES product_candidates(id) ON DELETE CASCADE,
  concept TEXT NOT NULL,
  hook TEXT NOT NULL,
  script TEXT NOT NULL,
  caption TEXT NOT NULL,
  version INTEGER NOT NULL DEFAULT 1,
  status TEXT NOT NULL DEFAULT 'DRAFT'
    CHECK (status IN ('DRAFT','IN_REVIEW','APPROVED','REJECTED')),
  approved_at TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_drafts_product ON content_drafts(product_id, created_at DESC);

CREATE TABLE IF NOT EXISTS experiment_observations (
  id TEXT PRIMARY KEY,
  content_draft_id TEXT NOT NULL REFERENCES content_drafts(id) ON DELETE CASCADE,
  channel TEXT NOT NULL DEFAULT 'TIKTOK',
  published_at TEXT,
  observation_window TEXT,
  views INTEGER,
  clicks INTEGER,
  orders INTEGER,
  commission_idr INTEGER,
  source_note TEXT NOT NULL DEFAULT '',
  observed_at TEXT NOT NULL,
  created_at TEXT NOT NULL,
  CHECK (views IS NULL OR views >= 0),
  CHECK (clicks IS NULL OR clicks >= 0),
  CHECK (orders IS NULL OR orders >= 0),
  CHECK (commission_idr IS NULL OR commission_idr >= 0)
);
CREATE INDEX IF NOT EXISTS idx_observations_content ON experiment_observations(content_draft_id, observed_at DESC);

CREATE TABLE IF NOT EXISTS audit_events (
  id TEXT PRIMARY KEY,
  actor_type TEXT NOT NULL,
  action TEXT NOT NULL,
  entity_type TEXT NOT NULL,
  entity_id TEXT,
  details_json TEXT NOT NULL DEFAULT '{}',
  created_at TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_audit_created ON audit_events(created_at DESC);