import 'package:cueue/domain/model/hierarchy/workspace/workspace_registration.dart';

abstract class WorkspaceRepository {
  Future<void> create(WorkspaceRegistration workspaceRegistration);
}
