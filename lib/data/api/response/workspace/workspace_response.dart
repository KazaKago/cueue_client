import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace_response.freezed.dart';
part 'workspace_response.g.dart';

@freezed
class WorkspaceResponse with _$WorkspaceResponse {
  const factory WorkspaceResponse({
    @JsonKey(name: 'id') required final int id,
    @JsonKey(name: 'name') required final String name,
  }) = _WorkspaceResponse;

  factory WorkspaceResponse.fromJson(final Map<String, dynamic> json) => _$WorkspaceResponseFromJson(json);
}
