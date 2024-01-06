// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuSummaryResponseImpl _$$MenuSummaryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuSummaryResponseImpl(
      id: json['id'] as int,
      memo: json['memo'] as String,
      date: json['date'] as String,
      timeFrame: json['time_frame'] as String,
      recipes: (json['recipes'] as List<dynamic>)
          .map((e) => RecipeSummaryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MenuSummaryResponseImplToJson(
        _$MenuSummaryResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memo': instance.memo,
      'date': instance.date,
      'time_frame': instance.timeFrame,
      'recipes': instance.recipes,
    };
