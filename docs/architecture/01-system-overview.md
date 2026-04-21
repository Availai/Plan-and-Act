# System Overview

## Product Framing

Plan and Act is an execution-focused planning app. The current product scope is built around two core systems:

1. `planning core`
2. `wisdom engine`

Supporting systems:

- `notifications`
- `settings`
- `analytics`

Video or media feed behavior is intentionally out of scope.

## Architectural Position

Correct foundations for this product:

- local-first speed
- deterministic behavior
- explainable scoring
- clean architecture
- sync-ready relational data
- premium dark UI that does not distract from execution

Wrong foundations:

- widget-driven business logic
- primary storage in key-value preferences
- opaque quote selection
- media-first dashboard behavior

## Bounded Contexts

- `planning`
- `wisdom_engine`
- `notifications`
- `settings`
- `analytics`

## Layering Rule

Each feature follows the same layers:

- `presentation`
- `application`
- `domain`
- `data`
- `core`

Rules:

- presentation does not talk directly to database or API clients
- application orchestrates use cases and lifecycle logic
- domain carries entities, value objects, policies, and repository contracts
- data implements repositories, mappers, local persistence, and remote adapters
- core carries time, errors, logging, results, constants, and theme primitives

## Non-Negotiable Decisions

- `Drift` is the local canonical store
- `SharedPreferences` is not used for primary domain persistence
- the Wisdom Engine remains deterministic and explainable
- notification scheduling is driven by application use cases
- the app runs in dark-only `Dracula Neon`
