// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeRequestImpl _$$RecipeRequestImplFromJson(Map<String, dynamic> json) =>
    _$RecipeRequestImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String?,
      imageKeys: (json['image_keys'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tagIds: (json['tag_ids'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$RecipeRequestImplToJson(_$RecipeRequestImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'image_keys': instance.imageKeys,
      'tag_ids': instance.tagIds,
    };
