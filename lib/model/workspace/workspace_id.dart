import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace_id.freezed.dart';

@freezed
class WorkspaceId with _$WorkspaceId {
  const factory WorkspaceId(int value) = _WorkspaceId;
}
