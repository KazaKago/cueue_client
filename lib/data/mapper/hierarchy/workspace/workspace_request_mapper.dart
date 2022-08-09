import 'package:cueue/data/api/request/workspace/workspace_request.dart';
import 'package:cueue/domain/model/hierarchy/workspace/workspace_registration.dart';

class WorkspaceRequestMapper {
  const WorkspaceRequestMapper();

  WorkspaceRequest map(WorkspaceRegistration workspaceRegistration) {
    return WorkspaceRequest(
      name: workspaceRegistration.name,
    );
  }
}
