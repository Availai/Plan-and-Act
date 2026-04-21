You are a principal Flutter + backend architect. Build a production-grade foundation for a mobile-first app called “Plan and Act”.

IMPORTANT:
Do not overengineer randomly. Optimize for:
1) deterministic behavior
2) explainability
3) local-first speed
4) clean architecture
5) long-term maintainability
6) premium UI foundation
7) crystal-clear rule engine behavior

PROJECT VISION
Plan and Act is not a generic to-do app.
It is an execution-focused planning app that helps users:
- create daily plans fast
- track execution
- receive context-matched motivational quotes from historical figures
- see a “Video of the Day” related to focus, discipline, action, resilience, leadership, learning, or planning

The quote engine must be deterministic first, not vague AI magic.
It must be explainable, score-based, layered, testable, and easy to evolve.

==================================================
TARGET TECH STACK (USE THIS UNLESS THERE IS A VERY STRONG REASON NOT TO)
==================================================

FRONTEND
- Flutter
- Dart
- Material 3
- go_router
- flutter_riverpod
- riverpod_annotation + riverpod_generator
- freezed + json_serializable
- dio
- flutter_local_notifications
- timezone

LOCAL DATA
- Drift (SQLite)
Reason:
- strong schema control
- relational modeling
- joins and advanced queries
- migration support
- deterministic offline behavior
- suitable for rule engine data, quotes, tags, logs, plans, streaks, and caching

CLOUD BACKEND
- Supabase
- Postgres
- Supabase Auth
- Supabase Edge Functions
- Supabase Storage if needed for thumbnails or media metadata cache
Reason:
- relational schema fits quotes/rules/tags/users/history better than pure document DB
- easier analytics and SQL-based ranking queries
- good long-term flexibility

VIDEO OF THE DAY
- Use YouTube Data API metadata only
- Do NOT design raw YouTube video downloading
- Store only:
  - youtube_video_id
  - title
  - description
  - thumbnail_url
  - channel_title
  - published_at
  - canonical_url
  - topic tags
- Render a “Video of the Day” card
- Opening behavior:
  - either embedded player on supported platforms
  - or external YouTube open fallback
- Design with quota awareness and caching

==================================================
ARCHITECTURE GOALS
==================================================

Implement a layered architecture:

presentation/
application/
domain/
data/
core/

Feature-first organization inside those layers.

Suggested feature modules:
- authentication
- planning
- wisdom_engine
- motivation_feed
- video_of_the_day
- notifications
- analytics
- settings

Architecture requirements:
- presentation layer must not talk directly to database or API clients
- application layer orchestrates use-cases
- domain layer contains entities, value objects, repository contracts, rule abstractions
- data layer contains Drift tables/DAOs, Supabase repositories, DTOs, mappers
- core contains shared utilities, error models, time providers, logging, theming, constants

==================================================
BUILD THE RULE ENGINE AS A FIRST-CLASS SYSTEM
==================================================

The Wisdom Engine is the heart of this app.
It must be deterministic, explainable, multi-layered, and precision-oriented.

DO NOT implement “if keyword then quote” only.
That is too naive.

Instead, design a multi-stage scoring engine.

--------------------------------------------------
1. INPUTS
--------------------------------------------------
The engine must consider:
- plan title
- plan description
- scheduled time
- plan duration if available
- plan category
- user streak status
- completion history
- recent failures / skips / postponements
- time of day
- energy mode if tracked
- user preferred tone
- last shown quotes
- last shown historical figures
- recent repetition fatigue

--------------------------------------------------
2. NORMALIZATION PIPELINE
--------------------------------------------------
Create a preprocessing layer:
- lowercase
- trim whitespace
- remove noise punctuation
- tokenize
- optional stemming / lightweight normalization
- synonym expansion dictionary
- domain lexicon mapping

Example semantic buckets:
- study
- work
- deep focus
- discipline
- exercise
- health
- resilience
- leadership
- creativity
- recovery
- consistency
- courage
- planning
- execution
- procrastination
- failure
- restart
- long-term effort

The engine must map raw plan text into one or more semantic categories.

--------------------------------------------------
3. HARD FILTERS
--------------------------------------------------
Before scoring, apply hard filters:
- quote must be active
- quote source must be trusted/approved
- quote language must match user locale
- quote must not be recently repeated
- quote must not belong to blocked categories
- quote must not exceed max length for UI
- quote tone must not conflict with user preference
- if plan is sensitive/personal, avoid insensitive or overly aggressive quotes

--------------------------------------------------
4. SOFT SCORING MODEL
--------------------------------------------------
Implement weighted scoring.

Each candidate quote should receive a final score from multiple dimensions:

A. category_match_score
- how well quote tags match extracted semantic plan categories

B. urgency_score
- if task is due soon or overdue, favor action-oriented quotes

C. effort_profile_score
- if task looks difficult, prefer grit / resilience / deep work quotes
- if task is small, prefer immediate action / start-now quotes

D. behavior_state_score
- if user has several recent failures, avoid overly grandiose or guilt-heavy quotes
- use recovery-oriented and restart-oriented messages

E. streak_score
- if user has a strong streak, reinforce momentum and consistency

F. diversity_penalty
- reduce score if same figure, same category, or same quote was shown recently

G. tone_alignment_score
- match to preferred tone:
  - calm
  - direct
  - intense
  - compassionate
  - strategic

H. time_of_day_score
- morning: activation / clarity / momentum
- afternoon: focus / discipline / persistence
- night: reflection / closure / reset for tomorrow

I. persona_alignment_score
- optional future layer:
  - achiever
  - learner
  - builder
  - competitor
  - steady-worker

Use a transparent weighted formula.
Weights must be configurable.
Do not hardcode everything inside one giant file.

--------------------------------------------------
5. OUTPUT CONTRACT
--------------------------------------------------
The engine must return not only the selected quote but also explainability metadata:
- selected_quote
- historical_figure
- source_reference
- selected_categories
- score_breakdown
- rejection_reasons for top discarded candidates
- user-facing explanation
- internal debug explanation

Example user-facing explanation:
“This quote was selected because your plan looks like a high-effort focus task scheduled for the morning, and you have a positive consistency streak.”

--------------------------------------------------
6. FALLBACK TIERS
--------------------------------------------------
If no strong candidate exists:
Tier 1: exact semantic match
Tier 2: close category match
Tier 3: generic execution quote
Tier 4: safe motivational fallback
Tier 5: neutral encouragement card with no quote

Never fail silently.

--------------------------------------------------
7. ANTI-CRINGE / QUALITY GUARDRAILS
--------------------------------------------------
This is extremely important.

The system must avoid:
- random famous quotes with weak relevance
- repeated Einstein/Napoleon/Steve Jobs overuse
- fake or unattributed quotes
- guilt-heavy messaging after repeated user failure
- overdramatic text for tiny tasks
- motivational mismatch

Design a quote quality policy:
- every quote has trust status
- every quote has attribution confidence
- every quote has tone label
- every quote has usage frequency cap
- every quote has sensitivity notes if needed

--------------------------------------------------
8. DECISION LOGGING
--------------------------------------------------
Log each rule-engine decision for analytics and debugging:
- user_id
- plan_id
- timestamp
- candidate_pool_size
- selected_quote_id
- top_5_candidate_scores
- reasons selected
- reasons rejected
- context features used

Make this queryable for future tuning.

==================================================
DATABASE DESIGN
==================================================

Design a robust schema for both local and cloud layers.

Local Drift tables should include at minimum:
- users
- plans
- plan_status_history
- plan_categories
- quotes
- quote_tags
- historical_figures
- figure_domains
- quote_sources
- quote_usage_history
- wisdom_rule_weights
- wisdom_synonyms
- wisdom_keyword_map
- daily_video_cache
- notifications
- streak_snapshots
- decision_logs

Cloud Postgres should mirror core business data with proper normalization.
Provide:
- SQL schema design
- Drift table design
- mapping strategy between local and remote
- sync conflict policy
- repository contracts

==================================================
PLAN DOMAIN MODEL
==================================================

A plan should support:
- id
- title
- description
- scheduled_date
- scheduled_time
- optional duration_minutes
- category
- tags
- priority
- status (planned, completed, skipped, postponed, canceled)
- created_at
- updated_at
- completed_at
- reminder_enabled
- reminder_time
- motivation_context_snapshot

==================================================
NOTIFICATION SYSTEM
==================================================

Implement notification planning rules:
- schedule local notification when a plan is created with reminder enabled
- reschedule on edit
- cancel on delete
- cancel or update on completion/postpone
- support timezone-safe scheduling
- separate notification IDs from plan IDs if needed
- add testable scheduling service abstraction

Need:
- notification service interface
- platform-safe implementation
- use-case coverage
- failure handling

==================================================
VIDEO OF THE DAY
==================================================

Build a clean “Video of the Day” subsystem.

Rules:
- no illegal downloading design
- metadata-driven only
- fetch via backend or edge function
- cache aggressively
- one daily featured video selected by tags
- tags should map to daily theme:
  - focus
  - discipline
  - action
  - resilience
  - learning
  - leadership
  - consistency
- if API quota is unavailable, serve last cached valid result
- track impression and click/open analytics

Tables:
- video_candidates
- daily_video_selection
- daily_video_cache
- video_topics
- video_impressions

==================================================
STATE MANAGEMENT RULES
==================================================

Use Riverpod correctly:
- providers initialize themselves
- avoid widget-driven business initialization
- separate async states cleanly
- use generated providers where it improves maintainability
- no random setState business logic
- repository access through providers only
- use immutable state objects

==================================================
UI / UX REQUIREMENTS
==================================================

Build a premium, modern, fast UI.

Core screens:
- Today Dashboard
- Add/Edit Plan Sheet
- Plan Detail
- Motivation Card
- Video of the Day Card
- History / Reflection Screen
- Settings

Design language:
- premium but restrained
- strong spacing rhythm
- high readability
- not visually noisy
- motivational but not childish
- elegant microinteractions
- focus on execution clarity

Add:
- empty states
- loading skeletons
- optimistic UI where appropriate
- failure states with recovery paths

==================================================
CODE QUALITY RULES
==================================================

Generate:
- clean folder structure
- repository interfaces
- DTOs + mappers
- entity models
- use-cases
- provider wiring
- Drift schema and DAOs
- Supabase repository stubs
- notification abstraction
- rule engine core classes
- seed data strategy
- tests

Testing requirements:
- unit tests for scoring logic
- unit tests for normalization
- unit tests for fallback logic
- repository tests where possible
- widget tests for main flows
- golden tests optional for critical cards
- rule engine test matrix with many edge cases

==================================================
DELIVERABLES
==================================================

I want you to produce the implementation in phases.

PHASE 1
- final recommended project structure
- dependency list
- architecture rationale
- domain model
- database schema proposal
- rule engine design spec

PHASE 2
- generate base code skeleton
- providers
- entities
- repositories
- use-cases
- drift setup
- core services

PHASE 3
- implement Wisdom Engine v1
- deterministic scoring
- explainability output
- seed quote data
- tests

PHASE 4
- implement notifications
- implement Video of the Day metadata flow
- cache and fallback strategy
- analytics logging

PHASE 5
- polish UI and integrate all flows

IMPORTANT OUTPUT STYLE
- Be concrete, not vague
- Make strong decisions
- Explain trade-offs
- Call out risks
- Reject weak architectural choices
- Prefer deterministic systems over pseudo-intelligent hacks
- If something is premature, say so
- If a simpler solution is better, choose it
- When recommending a component, explain why
- Show code that compiles, not pseudo-architecture only

Start by:
1. briefly critiquing this product idea from an architecture perspective
2. proposing the final tech stack with justification
3. designing the domain model
4. designing the database schema
5. designing the Wisdom Engine in full detail before writing implementation