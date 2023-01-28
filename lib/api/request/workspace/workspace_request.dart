import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace_request.freezed.dart';
part 'workspace_request.g.dart';

@freezed
class WorkspaceRequest with _$WorkspaceRequest {
  const factory WorkspaceRequest({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'name') required String name,
  }) = _WorkspaceRequest;

  factory WorkspaceRequest.fromJson(Map<String, dynamic> json) => _$WorkspaceRequestFromJson(json);
}
