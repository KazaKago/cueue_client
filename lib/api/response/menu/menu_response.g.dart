// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuResponseImpl _$$MenuResponseImplFromJson(Map<String, dynamic> json) =>
    _$MenuResponseImpl(
      id: json['id'] as int,
      memo: json['memo'] as String,
      date: json['date'] as String,
      timeFrame: json['time_frame'] as String,
      recipes: (json['recipes'] as List<dynamic>)
          .map((e) => RecipeSummaryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MenuResponseImplToJson(_$MenuResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memo': instance.memo,
      'date': instance.date,
      'time_frame': instance.timeFrame,
      'recipes': instance.recipes,
    };
