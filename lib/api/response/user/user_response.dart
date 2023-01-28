import 'package:cueue/api/response/content/content_response.dart';
import 'package:cueue/api/response/workspace/workspace_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'id') required int id,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'display_name') required String displayName,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'photo') required ContentResponse? photo,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'workspace') required WorkspaceResponse? workspace,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
}
