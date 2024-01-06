// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponseImpl _$$UserResponseImplFromJson(Map<String, dynamic> json) =>
    _$UserResponseImpl(
      id: json['id'] as int,
      displayName: json['display_name'] as String,
      photo: json['photo'] == null
          ? null
          : ContentResponse.fromJson(json['photo'] as Map<String, dynamic>),
      workspace: json['workspace'] == null
          ? null
          : WorkspaceResponse.fromJson(
              json['workspace'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserResponseImplToJson(_$UserResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.displayName,
      'photo': instance.photo,
      'workspace': instance.workspace,
    };
