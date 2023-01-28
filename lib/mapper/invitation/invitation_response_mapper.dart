import 'package:cueue/api/response/invitation/invitation_response.dart';
import 'package:cueue/mapper/workspace/workspace_response_mapper.dart';
import 'package:cueue/model/invitation/invitation.dart';
import 'package:cueue/model/invitation/invitation_code.dart';

class InvitationResponseMapper {
  const InvitationResponseMapper(this._workspaceResponseMapper);

  final WorkspaceResponseMapper _workspaceResponseMapper;

  Invitation call(InvitationResponse response) {
    return Invitation(
      code: InvitationCode(response.code),
      workspace: _workspaceResponseMapper(response.workspace),
      expiredAt: DateTime.parse(response.expiredAt),
    );
  }
}
