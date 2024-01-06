// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TagOrderRequestImpl _$$TagOrderRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$TagOrderRequestImpl(
      tagIds: (json['tag_ids'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$TagOrderRequestImplToJson(
        _$TagOrderRequestImpl instance) =>
    <String, dynamic>{
      'tag_ids': instance.tagIds,
    };
