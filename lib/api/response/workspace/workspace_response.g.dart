// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkspaceResponse _$$_WorkspaceResponseFromJson(Map<String, dynamic> json) => _$_WorkspaceResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      users: (json['users'] as List<dynamic>).map((e) => UserSummaryResponse.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$$_WorkspaceResponseToJson(_$_WorkspaceResponse instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'users': instance.users,
    };