// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeSummaryResponse _$$_RecipeSummaryResponseFromJson(Map<String, dynamic> json) => _$_RecipeSummaryResponse(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] == null ? null : ContentResponse.fromJson(json['image'] as Map<String, dynamic>),
      lastCookingAt: json['last_cooking_at'] as String?,
    );

Map<String, dynamic> _$$_RecipeSummaryResponseToJson(_$_RecipeSummaryResponse instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'last_cooking_at': instance.lastCookingAt,
    };
