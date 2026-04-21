# AGENTS.md

You are working on `Plan and Act`.

## Product Position

Plan and Act is not a generic todo app and not a media app.

It is a planning-first execution app that helps users:

- create daily plans fast
- track execution clearly
- receive deterministic, explainable wisdom from a trusted quote corpus
- build consistency through a focused daily dashboard

Video content is out of scope. Do not design, restore, or suggest a video subsystem unless explicitly requested by the user.

## Primary Engineering Values

Optimize for:

1. deterministic behavior
2. explainability
3. local-first speed
4. clean architecture
5. long-term maintainability
6. premium dark UI foundation
7. crystal-clear rule engine behavior

## Active UI Direction

The app is `dark-only v1`.

Visual language:

- Dracula-inspired background and panels
- restrained neon accents
- high contrast typography
- premium, not playful
- bold but controlled motion and glow

Palette baseline:

- page background `#282A36`
- panel background `#1E1F29`
- elevated panel `#343746`
- text `#F8F8F2`
- secondary text `#B8C1EC`
- accents `#8BE9FD`, `#FF79C6`, `#BD93F9`, `#50FA7B`, `#FFB86C`, `#FF5555`

Typography baseline:

- `JetBrains Mono` for emphasis, titles, chips, timestamps, metrics
- `IBM Plex Sans` for body and longer explanatory text

## Preferred Stack

### Frontend

- Flutter
- Dart
- Material 3
- go_router
- flutter_riverpod
- riverpod_annotation + riverpod_generator
- freezed + json_serializable

### Local Data

- Drift (SQLite)

### Cloud

- Supabase
- Postgres
- Supabase Auth
- Supabase Edge Functions

### Notifications

- flutter_local_notifications
- timezone

## Architecture

Use layered architecture:

- `presentation/`
- `application/`
- `domain/`
- `data/`
- `core/`

Feature-first modules:

- `planning`
- `wisdom_engine`
- `notifications`
- `analytics`
- `settings`
- `authentication` when needed

Rules:

- presentation must not access database or API clients directly
- application orchestrates use cases
- domain contains entities, value objects, policies, and repository contracts
- data contains Drift tables, DAOs, DTOs, mappers, and repository implementations
- core contains shared utilities, time, logging, errors, theming, and constants

## Wisdom Engine

The Wisdom Engine is a first-class deterministic subsystem.

It must:

- normalize plan text
- map text into semantic buckets
- apply hard filters before scoring
- compute transparent weighted scores
- avoid repetition and bad attribution
- produce explainability output
- log decisions for analytics and tuning

The engine must return:

- selected quote
- historical figure
- source reference
- selected categories
- score breakdown
- rejection reasons for high-ranking discarded candidates
- user-facing explanation
- internal debug explanation

Do not replace this with vague AI-style generation.

## Database Direction

Local Drift tables should cover:

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
- notifications
- streak_snapshots
- decision_logs

The old video tables were intentionally removed in schema v2. Do not reintroduce them by default.

## Notification Rules

- schedule local reminders when a plan is created with reminders enabled
- reschedule on edit
- cancel on delete
- cancel or update on completion/postpone
- keep timezone behavior explicit and testable
- use a scheduling abstraction, not direct widget calls

## UI Expectations

Core screens:

- Today Dashboard
- Add/Edit Plan Sheet
- Plan Detail
- Motivation Card
- History / Reflection
- Settings

UI requirements:

- premium and restrained
- strong spacing rhythm
- clear hierarchy
- no bright light theme fallback
- no flat default surfaces
- proper loading, empty, and failure states

Dashboard rules:

- `NextActionCard` is the top action surface
- show the next actionable plan or a compact ready state
- wisdom card supports, but does not overshadow, execution

## Code Quality

Generate and maintain:

- clean folder structure
- repository interfaces
- DTOs and mappers
- entity models
- use cases
- provider wiring
- Drift schema and DAOs
- notification abstraction
- rule engine core classes
- seed data strategy
- tests

Testing expectations:

- unit tests for scoring logic
- unit tests for normalization
- unit tests for fallback logic
- widget tests for main flows
- migration coverage for schema changes

## Delivery Bias

- make concrete decisions
- reject weak architecture
- prefer deterministic systems over pseudo-intelligence
- do not preserve dead features for nostalgia
- if a subsystem is out of scope, remove it cleanly
