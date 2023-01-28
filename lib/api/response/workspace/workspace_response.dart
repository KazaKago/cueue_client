import 'package:cueue/api/response/user/user_summary_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace_response.freezed.dart';
part 'workspace_response.g.dart';

@freezed
class WorkspaceResponse with _$WorkspaceResponse {
  const factory WorkspaceResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'id') required int id,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'name') required String name,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'users') required List<UserSummaryResponse> users,
  }) = _WorkspaceResponse;

  factory WorkspaceResponse.fromJson(Map<String, dynamic> json) => _$WorkspaceResponseFromJson(json);
}
