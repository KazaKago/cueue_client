// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeSummaryResponseImpl _$$RecipeSummaryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RecipeSummaryResponseImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] == null
          ? null
          : ContentResponse.fromJson(json['image'] as Map<String, dynamic>),
      lastCookingAt: json['last_cooking_at'] as String?,
    );

Map<String, dynamic> _$$RecipeSummaryResponseImplToJson(
        _$RecipeSummaryResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'last_cooking_at': instance.lastCookingAt,
    };
