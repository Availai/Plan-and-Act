# Data Schema and Sync

## Canonical Direction

- local runtime model: `Drift`
- remote sync model: `Postgres`

The app behaves local-first. Remote exists for sync, analytics, auth, and server-owned seed data.

## Syncable Table Groups

### Server-Owned

- `plan_categories`
- `historical_figures`
- `figure_domains`
- `quote_sources`
- `quotes`
- `quote_tags`
- `quote_tag_links`
- `wisdom_rule_weights`
- `wisdom_synonyms`
- `wisdom_keyword_map`

### User-Owned Syncable

- `users`
- `plan_tags`
- `plans`
- `plan_tag_links`
- `plan_status_history`
- `quote_usage_history`
- `decision_logs`
- `decision_log_candidates`
- `streak_snapshots`

### Local-Only

- `notifications`
- `sync_queue`

## Planning Tables

- `users`
- `plan_categories`
- `plan_tags`
- `plans`
- `plan_tag_links`
- `plan_status_history`
- `streak_snapshots`

## Wisdom Tables

- `historical_figures`
- `figure_domains`
- `historical_figure_domains`
- `quote_sources`
- `quotes`
- `quote_tags`
- `quote_tag_links`
- `wisdom_rule_weights`
- `wisdom_synonyms`
- `wisdom_keyword_map`
- `quote_usage_history`
- `decision_logs`
- `decision_log_candidates`

## Notification Tables

- `notifications`

## Migration Note

Schema version `2` removes the old video tables:

- `video_candidates`
- `video_topics`
- `video_candidate_topics`
- `daily_video_selections`
- `video_impressions`
- `daily_video_cache`

Planning, wisdom, and notification data remain intact during the upgrade.

## Conflict Policy

### Plans

- optimistic sync
- `version` plus `updated_at`
- latest valid write wins for mutable fields

### Status History

- append-only
- never overwritten

### Quote Usage / Decision Logs

- event-style merge
- no overwrite semantics

## Minimum Index Set

- `plans(user_id, scheduled_date, status)`
- `plans(user_id, scheduled_at_utc)`
- `plan_status_history(plan_id, changed_at desc)`
- `quotes(language_code, is_active, trust_status, tone)`
- `quote_usage_history(user_id, quote_id, created_at desc)`
- `decision_logs(user_id, created_at desc)`
- `decision_log_candidates(decision_log_id, total_score desc)`
- `notifications(plan_id, status)`
