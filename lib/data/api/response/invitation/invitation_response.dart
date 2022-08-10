import 'package:cueue/data/api/response/workspace/workspace_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation_response.freezed.dart';

part 'invitation_response.g.dart';

@freezed
class InvitationResponse with _$InvitationResponse {
  const factory InvitationResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'code') required String code,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'workspace') required WorkspaceResponse workspace,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'expire_at') required String expiredAt,
  }) = _InvitationResponse;

  factory InvitationResponse.fromJson(Map<String, dynamic> json) => _$InvitationResponseFromJson(json);
}
