// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvitationResponseImpl _$$InvitationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$InvitationResponseImpl(
      code: json['code'] as String,
      workspace:
          WorkspaceResponse.fromJson(json['workspace'] as Map<String, dynamic>),
      expiredAt: json['expire_at'] as String,
    );

Map<String, dynamic> _$$InvitationResponseImplToJson(
        _$InvitationResponseImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'workspace': instance.workspace,
      'expire_at': instance.expiredAt,
    };
