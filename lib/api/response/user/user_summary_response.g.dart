// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSummaryResponseImpl _$$UserSummaryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserSummaryResponseImpl(
      id: json['id'] as int,
      displayName: json['display_name'] as String,
      photo: json['photo'] == null
          ? null
          : ContentResponse.fromJson(json['photo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserSummaryResponseImplToJson(
        _$UserSummaryResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.displayName,
      'photo': instance.photo,
    };
