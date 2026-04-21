import 'package:planandact/features/wisdom_engine/domain/entities/quote_entity.dart';

/// Repository contract for quotes data access.
abstract class QuoteRepository {
  /// Returns all active quotes matching given criteria.
  Future<List<QuoteEntity>> getActiveQuotes({
    String? languageCode,
    int? limit,
  });

  /// Returns quotes by tag slugs (for candidate retrieval).
  Future<List<QuoteEntity>> getQuotesByTagSlugs(List<String> tagSlugs);

  /// Returns a quote by ID.
  Future<QuoteEntity?> getQuoteById(String quoteId);
}
