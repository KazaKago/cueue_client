import 'package:cueue/data/api/response/workspace/workspace_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';

part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    @JsonKey(name: 'id') required final int id,
    @JsonKey(name: 'workspaces') required final List<WorkspaceResponse> workspaces,
  }) = _UserResponse;

  factory UserResponse.fromJson(final Map<String, dynamic> json) => _$UserResponseFromJson(json);
}
