# System Overview

## Product Framing

Plan and Act bir todo uygulamasi degil. Cekirdek amaci:

- gunluk plani hizli olusturmak
- uygulama icinde execution takibi yapmak
- deterministic ve explainable motivasyon secimi sunmak
- gunluk odak temasi ile "Video of the Day" gostermek

Bu nedenle sistem uc bagimsiz ama baglantili eksen uzerine kurulur:

1. `planning core`
2. `wisdom engine`
3. `motivation media`

## Architectural Position

Bu proje icin dogru zemin:

- local-first hiz
- deterministic behavior
- explainable scoring
- clean architecture
- sync-ready data model

Yanlis zemin:

- widget-driven business logic
- key-value storage ile ana domain tasimak
- tek servis dosyasinda hem secim hem log hem scoring yapmak
- "AI magic" gibi gorunen ama aciklanamayan quote secimi

## Bounded Contexts

Sistemi su bounded context'lere bolmek gerekir:

- `planning`
- `wisdom_engine`
- `video_of_the_day`
- `notifications`
- `user_preferences`
- `analytics` bir domain degil, cross-cutting telemetry katmanidir

## Layering Rule

Her feature ayni katman mantigina uyar:

- `presentation`
- `application`
- `domain`
- `data`
- `core`

Kurallar:

- presentation dogrudan database veya API istemcisine konusmaz
- application use-case ve orchestration katmanidir
- domain entity, value object, repository contract ve policy tasir
- data DTO, mapper, local/remote repository implementasyonu tasir
- core zaman, hata, logging, result, constants gibi ortak altyapiyi tasir

## Non-Negotiable Decisions

- `SharedPreferences`, plan ana depolama katmani olarak kaldirilacak
- `Drift`, local canonical storage olacak
- `Supabase/Postgres`, remote sync ve server-owned data kaynagi olacak
- Wisdom Engine helper servis degil, bagimsiz subsystem olacak
- Notification scheduling UI icinden degil application use-case icinden yonetilecek

## Current Repo vs Target

Su an repoda:

- Riverpod var
- temel feature ayrimi baslamis durumda
- plan akisi calisiyor
- wisdom secimi tek servis icinde prototip olarak mevcut
- local storage `SharedPreferences`

Hedefte:

- iliskisel local schema
- repository contract seti
- explainable decision logging
- sync-ready plan lifecycle
- metadata-only video altyapisi
- notification abstraction

## Phase 2 Entry Gate

Kod yazmaya gecmeden once su kararlar sabitlenmis sayilacak:

- hedef dosya yapisi kabul edildi
- local schema omurgasi kabul edildi
- Wisdom Engine pipeline kabul edildi
- sync politikasinin temel kurallari kabul edildi
