// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeResponse _$_$_RecipeResponseFromJson(Map<String, dynamic> json) {
  return _$_RecipeResponse(
    id: json['id'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    url: json['url'] as String?,
    images: (json['images'] as List<dynamic>)
        .map((e) => ContentResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    tags: (json['tags'] as List<dynamic>)
        .map((e) => TagResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    cookingHistories: (json['cooking_histories'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    cookingCount: json['cooking_count'] as int,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$_$_RecipeResponseToJson(_$_RecipeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'images': instance.images,
      'tags': instance.tags,
      'cooking_histories': instance.cookingHistories,
      'cooking_count': instance.cookingCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
