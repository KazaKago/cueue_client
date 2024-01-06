// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuRequestImpl _$$MenuRequestImplFromJson(Map<String, dynamic> json) =>
    _$MenuRequestImpl(
      memo: json['memo'] as String,
      date: json['date'] as String,
      timeFrame: json['time_frame'] as String,
      recipeIds:
          (json['recipe_ids'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$MenuRequestImplToJson(_$MenuRequestImpl instance) =>
    <String, dynamic>{
      'memo': instance.memo,
      'date': instance.date,
      'time_frame': instance.timeFrame,
      'recipe_ids': instance.recipeIds,
    };
