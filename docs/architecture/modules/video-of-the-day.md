# Video of the Day Module

## Responsibility

Bu modul YouTube video indirme sistemi degildir. Sadece metadata tabanli secim, cache ve gosterim akisidir.

Sorumluluklari:

- gunluk video adaylarini metadata olarak almak
- secilen gunluk videoyu cachelemek
- UI karti icin okunabilir veri sunmak
- impression ve open event'lerini loglamak
- API quota dusukse son gecerli cache'e donmek

## Rules

- raw video download tasarlanmaz
- sadece metadata tutulur
- canonical URL kullanilir
- video secimi topic/theme bazli olur
- son gecerli video cache'i fallback olarak kullanilir

## Core Entities

### VideoCandidate

- `id`
- `youtubeVideoId`
- `title`
- `description`
- `thumbnailUrl`
- `channelTitle`
- `publishedAt`
- `canonicalUrl`
- `languageCode?`
- `isActive`
- `fetchedAt`

### DailyVideoSelection

- `id`
- `selectionDate`
- `topicId`
- `videoCandidateId`
- `selectionReason`
- `createdAt`

### VideoImpression

- `id`
- `userId`
- `dailyVideoSelectionId`
- `videoCandidateId`
- `eventType`
- `createdAt`

## Supported Themes

- `focus`
- `discipline`
- `action`
- `resilience`
- `learning`
- `leadership`
- `consistency`

## Deterministic Daily Theme Mapping (v1)

Gun bazli tema secimi deterministic olmalidir. V1 icin kural:

- Monday -> `focus`
- Tuesday -> `discipline`
- Wednesday -> `action`
- Thursday -> `resilience`
- Friday -> `learning`
- Saturday -> `leadership`
- Sunday -> `consistency`

Notlar:

- Tum istemciler UTC weekday uzerinden ayni sonucu uretir.
- Remote tarafta ilgili tema ile filtrelenmis video secimi istenir.
- Bu strateji random secime gore daha aciklanabilir analytics davranisi verir.

## Data Flow

1. backend veya edge function video metadata getirir
2. uygun adaylar topic ile eslenir
3. daily selection kaydi olusturulur
4. local cache guncellenir
5. UI card provider cache-first veri okur
6. user acarsa impression/open analytics yazilir

## Repository Contracts

- `VideoRepository`
- `DailyVideoRepository`
- `VideoAnalyticsRepository`

## Failure Policy

- API quota yoksa son cache kullanilir
- cache de yoksa kart graceful empty state gosterir
- hatada planner akisina etkisi olmaz

## UI Scope

- `VideoOfTheDayCard`
- acis davranisi:
  - embedded player destekliyorsa embed
  - degilse external YouTube open fallback
