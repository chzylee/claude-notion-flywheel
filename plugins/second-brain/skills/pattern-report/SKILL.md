---
name: pattern-report
description: Analyze work patterns from the Work Log. Triggers on "analyze my work patterns", "pattern report", "monthly pattern report". Aggregates Kind mix, pillar mix (via Effort relation), cadence/streaks/gaps, and surface mix over a window (default 4 weeks), compares to the previous window, and gives 1-3 evidence-cited observations. Read-only.
---

# Pattern Report

The analytics layer on top of the Work Log - what the Kind field exists for. Distinct from Weekly
Digest: the Digest says what happened this week; this says what you systematically do over time.

## Data source IDs
- Work Log: 050c4600-3aeb-4d12-9af1-71bb72c0a2c5  (Kind, Date, Surface, Effort relation)
- Efforts:  0cc8af20-2f35-4e0c-985f-67ddddd2e5b0  (Pillar - resolved via relation)

## Steps
1. WINDOW: default last 4 weeks; honor any requested range/pillar scope. Also pull the previous
   equal-length window for comparison.
2. AGGREGATE Work Log entries in window:
   - Kind mix: count + % per Kind (Build/Write/Plan/Stream/Event/Admin).
   - Pillar mix: resolve each entry's Effort -> Pillar; count + %.
   - Cadence: entries per week; longest active streak; longest gap.
   - Effort concentration: top 3 efforts by entry count; number of efforts untouched.
   - Surface mix: Claude chat vs Claude Code vs Manual.
3. COMPARE to the previous window: what rose, fell, disappeared.
4. OBSERVE: 1-3 observations, each citing the numbers behind it (e.g. "80% Build, 4% Write - content
   debt will keep growing at this ratio"). No generic advice.
5. OPTIONAL (on request): log the report as a Work Log row "Pattern report - [range]", Kind=Admin, dedup on title.

## Key rules
- Honest denominator: this measures logged work. If debriefing is inconsistent, say so - low Write
  count may mean low logging, not low writing.
- Once ~6+ weeks of data exist, trends become meaningful; before that, keep observations tentative.
