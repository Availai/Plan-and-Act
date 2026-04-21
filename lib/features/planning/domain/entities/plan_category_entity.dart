import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_category_entity.freezed.dart';
part 'plan_category_entity.g.dart';

/// Reference entity for plan categories.
///
/// Not an enum — managed as server-owned reference data.
@freezed
class PlanCategoryEntity with _$PlanCategoryEntity {
  const factory PlanCategoryEntity({
    required String id,
    required String slug,
    required String name,
    @Default('category') String iconKey,
    @Default('primary') String colorKey,
    @Default(true) bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PlanCategoryEntity;

  factory PlanCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$PlanCategoryEntityFromJson(json);
}
