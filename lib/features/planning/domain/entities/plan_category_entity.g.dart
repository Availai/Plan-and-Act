// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanCategoryEntityImpl _$$PlanCategoryEntityImplFromJson(
  Map<String, dynamic> json,
) => _$PlanCategoryEntityImpl(
  id: json['id'] as String,
  slug: json['slug'] as String,
  name: json['name'] as String,
  iconKey: json['iconKey'] as String? ?? 'category',
  colorKey: json['colorKey'] as String? ?? 'primary',
  isActive: json['isActive'] as bool? ?? true,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$PlanCategoryEntityImplToJson(
  _$PlanCategoryEntityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'name': instance.name,
  'iconKey': instance.iconKey,
  'colorKey': instance.colorKey,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
