import 'package:drift/drift.dart';
import 'package:planandact/shared/data/local/app_database.dart';

/// Seed data payload for the Wisdom Engine database initialization.
class WisdomSeedData {
  WisdomSeedData._();

  /// Populates initial wisdom reference data.
  static Future<void> seed(AppDatabase db) async {
    final now = DateTime.now();

    // 1. Figures
    final figures = [
      HistoricalFiguresCompanion.insert(
        id: 'fig_m_aurelius',
        name: 'Marcus Aurelius',
        era: const Value('Antik Roma'),
        shortBio: const Value('Roma İmparatoru ve Stoacı Filozof'),
        createdAt: now,
        updatedAt: now,
      ),
      HistoricalFiguresCompanion.insert(
        id: 'fig_ataturk',
        name: 'Mustafa Kemal Atatürk',
        era: const Value('20. Yüzyıl'),
        shortBio: const Value('Türkiye Cumhuriyeti Kurucusu'),
        createdAt: now,
        updatedAt: now,
      ),
      HistoricalFiguresCompanion.insert(
        id: 'fig_seneca',
        name: 'Seneca',
        era: const Value('Antik Roma'),
        shortBio: const Value('Stoacı Filozof ve Yazar'),
        createdAt: now,
        updatedAt: now,
      ),
    ];

    for (var f in figures) {
      await db.into(db.historicalFigures).insert(f, mode: InsertMode.insertOrIgnore);
    }

    // 2. Tags
    final tags = [
      QuoteTagsCompanion.insert(
        id: 'tag_discipline',
        slug: 'discipline',
        name: 'Disiplin',
        createdAt: now,
      ),
      QuoteTagsCompanion.insert(
        id: 'tag_resilience',
        slug: 'resilience',
        name: 'Dayanıklılık',
        createdAt: now,
      ),
      QuoteTagsCompanion.insert(
        id: 'tag_execution',
        slug: 'execution',
        name: 'Uygulama',
        createdAt: now,
      ),
      QuoteTagsCompanion.insert(
        id: 'tag_deepFocus',
        slug: 'deepFocus',
        name: 'Derin Odak',
        createdAt: now,
      ),
    ];

    for (var t in tags) {
      await db.into(db.quoteTags).insert(t, mode: InsertMode.insertOrIgnore);
    }

    // 3. Quotes
    final quotes = [
      QuotesCompanion.insert(
        id: 'q_aurelius_1',
        quoteText: 'Şafağın ilk ışıklarında, yataktan çıkmakta zorlandığında kendine şunu hatırlat: Bir insan olarak görevimi yapmak için uyanıyorum.',
        figureId: 'fig_m_aurelius',
        tone: const Value('direct'),
        attributionConfidence: const Value(1.0),
        createdAt: now,
        updatedAt: now,
      ),
      QuotesCompanion.insert(
        id: 'q_ataturk_1',
        quoteText: 'Dinlenmemek üzere yürümeye karar verenler, asla ve asla yorulmazlar.',
        figureId: 'fig_ataturk',
        tone: const Value('intense'),
        attributionConfidence: const Value(1.0),
        createdAt: now,
        updatedAt: now,
      ),
      QuotesCompanion.insert(
        id: 'q_seneca_1',
        quoteText: 'Hayat kısa değil, biz onun çoğunu boşa harcıyoruz.',
        figureId: 'fig_seneca',
        tone: const Value('strategic'),
        attributionConfidence: const Value(1.0),
        createdAt: now,
        updatedAt: now,
      ),
      QuotesCompanion.insert(
        id: 'q_aurelius_2',
        quoteText: 'Senin elinde olmayan şeyler için endişelenmeyi bırak. Odaklanman gereken tek şey kendi davranışlarındır.',
        figureId: 'fig_m_aurelius',
        tone: const Value('calm'),
        attributionConfidence: const Value(0.9),
        createdAt: now,
        updatedAt: now,
      ),
    ];

    for (var q in quotes) {
      await db.into(db.quotes).insert(q, mode: InsertMode.insertOrIgnore);
    }

    // 4. Quote Tag Links
    final links = [
      QuoteTagLinksCompanion.insert(quoteId: 'q_aurelius_1', tagId: 'tag_execution'),
      QuoteTagLinksCompanion.insert(quoteId: 'q_aurelius_1', tagId: 'tag_discipline'),
      QuoteTagLinksCompanion.insert(quoteId: 'q_ataturk_1', tagId: 'tag_resilience'),
      QuoteTagLinksCompanion.insert(quoteId: 'q_ataturk_1', tagId: 'tag_execution'),
      QuoteTagLinksCompanion.insert(quoteId: 'q_seneca_1', tagId: 'tag_deepFocus'),
      QuoteTagLinksCompanion.insert(quoteId: 'q_aurelius_2', tagId: 'tag_deepFocus'),
    ];

    for (var l in links) {
      await db.into(db.quoteTagLinks).insert(l, mode: InsertMode.insertOrIgnore);
    }
  }
}
