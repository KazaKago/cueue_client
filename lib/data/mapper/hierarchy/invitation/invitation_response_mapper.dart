import 'package:cueue/data/api/response/invitation/invitation_response.dart';
import 'package:cueue/data/mapper/hierarchy/workspace/workspace_response_mapper.dart';
import 'package:cueue/domain/model/hierarchy/invitation/invitation.dart';
import 'package:cueue/domain/model/hierarchy/invitation/invitation_code.dart';

class InvitationResponseMapper {
  const InvitationResponseMapper(this._workspaceResponseMapper);

  final WorkspaceResponseMapper _workspaceResponseMapper;

  Invitation map(InvitationResponse response) {
    return Invitation(
      code: InvitationCode(response.code),
      workspace: _workspaceResponseMapper.map(response.workspace),
      expiredAt: DateTime.parse(response.expiredAt),
    );
  }
}
