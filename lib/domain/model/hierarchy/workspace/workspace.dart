import 'package:cueue/domain/model/hierarchy/user/user_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace.freezed.dart';

@freezed
class Workspace with _$Workspace {
  const factory Workspace({
    required String name,
    required List<UserSummary> users,
  }) = _Workspace;
}
