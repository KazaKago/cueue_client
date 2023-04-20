// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserSummaryResponse _$$_UserSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    _$_UserSummaryResponse(
      id: json['id'] as int,
      displayName: json['display_name'] as String,
      photo: json['photo'] == null
          ? null
          : ContentResponse.fromJson(json['photo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserSummaryResponseToJson(
        _$_UserSummaryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.displayName,
      'photo': instance.photo,
    };
