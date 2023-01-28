// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TagOrderRequest _$$_TagOrderRequestFromJson(Map<String, dynamic> json) => _$_TagOrderRequest(
      tagIds: (json['tag_ids'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_TagOrderRequestToJson(_$_TagOrderRequest instance) => <String, dynamic>{
      'tag_ids': instance.tagIds,
    };
