import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/planning/domain/entities/plan_category_entity.dart';

/// Repository contract for plan categories (reference data).
abstract class PlanCategoryRepository {
  /// Returns all active categories.
  Future<Result<List<PlanCategoryEntity>>> getActiveCategories();

  /// Returns a category by slug.
  Future<Result<PlanCategoryEntity>> getCategoryBySlug(String slug);
}
