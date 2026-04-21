# Data Schema and Sync

## Canonical Direction

Canonical remote model `Postgres`, canonical local runtime model `Drift` olacak.

Pratikte:

- local taraf hiz ve offline davranis icin ana calisma zemini
- remote taraf sync, auth, seed data ve analytics toplama icin ana sistem

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
- `video_candidates`
- `video_topics`
- `daily_video_selection`

### User-Owned Syncable

- `users`
- `plan_tags`
- `plans`
- `plan_tag_links`
- `plan_status_history`
- `quote_usage_history`
- `decision_logs`
- `decision_log_candidates`
- `video_impressions`
- `streak_snapshots`

### Local-Only

- `notifications`
- `daily_video_cache`
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

## Video Tables

- `video_candidates`
- `video_topics`
- `video_candidate_topics`
- `daily_video_selection`
- `video_impressions`
- `daily_video_cache`

## Notification Tables

- `notifications`

## Core Column Policy

Tum syncable tablolarda:

- `id`
- `created_at`
- `updated_at`
- `deleted_at?`
- `version`

Plan ve reminder zamanlarinda:

- `scheduled_date`
- `scheduled_time_local`
- `scheduled_timezone`
- `scheduled_at_utc`

## Conflict Policy

### Plans

- optimistic sync
- `version` ve `updated_at` birlikte kullanilir
- edit alanlarinda latest valid write wins

### Status History

- overwrite edilmez
- append-only tutulur

### Quote Usage / Decision Logs

- event-style oldugu icin merge edilir
- overwrite mantigi uygulanmaz

### Seed Data

- client tarafindan yazilmaz
- server-owned kabul edilir

## Minimum Index Set

- `plans(user_id, scheduled_date, status)`
- `plans(user_id, scheduled_at_utc)`
- `plan_status_history(plan_id, changed_at desc)`
- `quotes(language_code, is_active, trust_status, tone)`
- `quote_usage_history(user_id, quote_id, created_at desc)`
- `decision_logs(user_id, created_at desc)`
- `decision_log_candidates(decision_log_id, total_score desc)`
- `daily_video_selection(selection_date)`
- `notifications(plan_id, status)`

## Why This Matters

Bu schema omurgasi olmadan:

- Wisdom Engine explainability kaydi tutulamaz
- reminder lifecycle saglamlasmaz
- local-first davranis buyuyemez
- sync sonrasi veri drift'i artar
