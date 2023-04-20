// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InvitationResponse _$$_InvitationResponseFromJson(
        Map<String, dynamic> json) =>
    _$_InvitationResponse(
      code: json['code'] as String,
      workspace:
          WorkspaceResponse.fromJson(json['workspace'] as Map<String, dynamic>),
      expiredAt: json['expire_at'] as String,
    );

Map<String, dynamic> _$$_InvitationResponseToJson(
        _$_InvitationResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'workspace': instance.workspace,
      'expire_at': instance.expiredAt,
    };
