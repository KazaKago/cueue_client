// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuResponse _$_$_MenuResponseFromJson(Map<String, dynamic> json) {
  return _$_MenuResponse(
    id: json['id'] as int,
    memo: json['memo'] as String,
    date: json['date'] as String,
    timeFrame: json['time_frame'] as String,
    recipes: (json['recipes'] as List<dynamic>)
        .map((e) => RecipeSummaryResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_MenuResponseToJson(_$_MenuResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memo': instance.memo,
      'date': instance.date,
      'time_frame': instance.timeFrame,
      'recipes': instance.recipes,
    };
