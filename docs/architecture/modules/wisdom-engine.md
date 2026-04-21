# Wisdom Engine Module

## Responsibility

Wisdom Engine bir helper servis degil, deterministic quote selection subsystem'idir.

Sorumluluklari:

- plan baglamini toplamak
- metni normalize etmek
- semantic bucket cikarmak
- aday quote havuzu getirmek
- hard filter uygulamak
- soft scoring yapmak
- fallback tier secmek
- explainability metadata uretmek
- decision log kaydetmek

## Input Contract

Ana giris nesnesi `WisdomContext` olmalidir:

- `planId`
- `userId`
- `title`
- `description`
- `scheduledAt`
- `durationMinutes?`
- `categorySlug?`
- `priority`
- `currentStatus`
- `currentStreak`
- `recentCompletionRate7d`
- `recentPostponementCount7d`
- `recentSkipCount7d`
- `timeOfDaySegment`
- `preferredTone`
- `recentQuoteIds`
- `recentFigureIds`
- `recentSemanticBuckets`
- `locale`
- `timezone`

Turetilmis context alanlari:

- `taskSize`
- `urgencyBand`
- `behaviorState`
- `sensitivityLevel`

## Pipeline

1. `WisdomContextAssembler`
2. `TextNormalizer`
3. `SemanticBucketExtractor`
4. `CandidateRetriever`
5. `HardFilterEngine`
6. `QuoteScorer`
7. `DiversityPolicy`
8. `QuoteSelector`
9. `ExplanationBuilder`
10. `DecisionLogger`

## Normalization Rules

Metin preprocessing:

- lowercase
- trim
- whitespace collapse
- noise punctuation removal
- tokenize
- synonym expansion
- keyword to semantic bucket mapping

Semantic bucket seti:

- `study`
- `work`
- `deep_focus`
- `discipline`
- `exercise`
- `health`
- `resilience`
- `leadership`
- `creativity`
- `recovery`
- `consistency`
- `courage`
- `planning`
- `execution`
- `procrastination`
- `failure`
- `restart`
- `long_term_effort`

## Hard Filters

Puanlamadan once uygulanir:

- quote aktif olmali
- source trusted olmali
- locale uyumlu olmali
- recent quote cooldown disinda olmali
- blocked category icinde olmamali
- UI max length icinde olmali
- tone conflict olmamali
- sensitive task icin uygunsuz quote elenmeli
- attribution confidence minimum esik ustunde olmali

## Soft Scoring

Her aday icin `0.0 - 1.0` arasi subscore hesaplanir.

Baseline weights:

- `categoryMatch = 0.30`
- `urgency = 0.10`
- `effortProfile = 0.14`
- `behaviorState = 0.14`
- `streak = 0.08`
- `toneAlignment = 0.10`
- `timeOfDay = 0.06`
- `personaAlignment = 0.03`
- `qualityBonus = 0.05`
- `diversityPenalty = -0.15`

Final score:

```text
100 * (
  0.30*categoryMatch +
  0.10*urgency +
  0.14*effortProfile +
  0.14*behaviorState +
  0.08*streak +
  0.10*toneAlignment +
  0.06*timeOfDay +
  0.03*personaAlignment +
  0.05*qualityBonus
) - 100 * diversityPenalty
```

## Tie-Break Rules

Skor esitliginde sira:

1. daha yuksek trust status
2. daha yuksek attribution confidence
3. daha dusuk recent usage
4. daha iyi tone alignment
5. daha kisa ve UI-friendly quote
6. stable sort key

Bu deterministic olmak zorundadir.

## Fallback Tiers

- `Tier 1`: exact semantic match
- `Tier 2`: close category match
- `Tier 3`: generic execution quote
- `Tier 4`: safe motivational fallback
- `Tier 5`: neutral no-quote encouragement card

Engine hicbir zaman sessizce bos donmez.

## Output Contract

`WisdomSelectionResult` su alanlari tasir:

- `selectedQuoteId?`
- `selectedQuoteText?`
- `historicalFigureName?`
- `sourceReference?`
- `selectedCategories`
- `fallbackTier`
- `finalScore`
- `scoreBreakdown`
- `topRejectedCandidates`
- `userFacingExplanation`
- `debugExplanation`
- `decisionTimestamp`

## Data Dependencies

- `quotes`
- `quote_tags`
- `quote_tag_links`
- `historical_figures`
- `quote_sources`
- `wisdom_rule_weights`
- `wisdom_synonyms`
- `wisdom_keyword_map`
- `quote_usage_history`
- `decision_logs`
- `decision_log_candidates`

## Anti-Cringe Policy

- fake veya zayif dogrulanmis quote elenir
- ayni figure tekrarina cap uygulanir
- kucuk gorev icin fazla dramatik quote cezalanir
- repeated failure sonrasi guilt-heavy ton bastirilir
- author diversity korunur

## Required Tests

- normalization
- semantic extraction
- hard filter rejection
- scoring matrix
- fallback logic
- diversity penalty
- same input => same output determinism
- explanation fields non-empty
