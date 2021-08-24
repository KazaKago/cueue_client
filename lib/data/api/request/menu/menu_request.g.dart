// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuRequest _$_$_MenuRequestFromJson(Map<String, dynamic> json) {
  return _$_MenuRequest(
    memo: json['memo'] as String,
    date: json['date'] as String,
    timeFrame: json['time_frame'] as String,
    recipeIds:
        (json['recipe_ids'] as List<dynamic>).map((e) => e as int).toList(),
  );
}

Map<String, dynamic> _$_$_MenuRequestToJson(_$_MenuRequest instance) =>
    <String, dynamic>{
      'memo': instance.memo,
      'date': instance.date,
      'time_frame': instance.timeFrame,
      'recipe_ids': instance.recipeIds,
    };
