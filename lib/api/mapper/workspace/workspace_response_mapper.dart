import 'package:cueue/api/mapper/user/user_summary_response_mapper.dart';
import 'package:cueue/api/response/workspace/workspace_response.dart';
import 'package:cueue/model/workspace/workspace.dart';
import 'package:cueue/model/workspace/workspace_id.dart';

class WorkspaceResponseMapper {
  const WorkspaceResponseMapper(this._userSummaryResponseMapper);

  final UserSummaryResponseMapper _userSummaryResponseMapper;

  Workspace call(WorkspaceResponse response) {
    return Workspace(
      id: WorkspaceId(response.id),
      name: response.name,
      users: response.users.map(_userSummaryResponseMapper.call).toList(),
    );
  }
}
