// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeRequest _$_$_RecipeRequestFromJson(Map<String, dynamic> json) {
  return _$_RecipeRequest(
    title: json['title'] as String,
    description: json['description'] as String,
    url: json['url'] as String?,
    imageKeys:
        (json['image_keys'] as List<dynamic>).map((e) => e as String).toList(),
    tagIds: (json['tag_ids'] as List<dynamic>).map((e) => e as int).toList(),
  );
}

Map<String, dynamic> _$_$_RecipeRequestToJson(_$_RecipeRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'image_keys': instance.imageKeys,
      'tag_ids': instance.tagIds,
    };
