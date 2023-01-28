import 'package:cueue/model/user/user_summary.dart';
import 'package:cueue/model/workspace/workspace_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace.freezed.dart';

@freezed
class Workspace with _$Workspace {
  const factory Workspace({
    required WorkspaceId id,
    required String name,
    required List<UserSummary> users,
  }) = _Workspace;
}
