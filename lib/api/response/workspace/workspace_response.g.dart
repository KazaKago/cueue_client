// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkspaceResponseImpl _$$WorkspaceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkspaceResponseImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      users: (json['users'] as List<dynamic>)
          .map((e) => UserSummaryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkspaceResponseImplToJson(
        _$WorkspaceResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'users': instance.users,
    };
