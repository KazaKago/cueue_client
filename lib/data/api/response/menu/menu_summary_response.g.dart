// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuSummaryResponse _$$_MenuSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    _$_MenuSummaryResponse(
      id: json['id'] as int,
      memo: json['memo'] as String,
      date: json['date'] as String,
      timeFrame: json['time_frame'] as String,
      recipes: (json['recipes'] as List<dynamic>)
          .map((e) => RecipeSummaryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MenuSummaryResponseToJson(
        _$_MenuSummaryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memo': instance.memo,
      'date': instance.date,
      'time_frame': instance.timeFrame,
      'recipes': instance.recipes,
    };
