import 'package:cueue/domain/repository/hierarchy/workspace/workspace_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/workspace/create_workspace_usecase.dart';

class CreateWorkspaceUseCaseImpl implements CreateWorkspaceUseCase {
  const CreateWorkspaceUseCaseImpl(this._workspaceRepository);

  final WorkspaceRepository _workspaceRepository;

  @override
  Future<void> call() async {
    const workspaceName = 'personal'; // Currently workspace name is fixed.
    await _workspaceRepository.create(workspaceName);
  }
}
