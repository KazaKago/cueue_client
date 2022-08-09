import 'package:cueue/domain/model/hierarchy/workspace/workspace_registration.dart';
import 'package:cueue/domain/repository/hierarchy/workspace/workspace_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/workspace/create_workspace_usecase.dart';

class CreateWorkspaceUseCaseImpl implements CreateWorkspaceUseCase {
  const CreateWorkspaceUseCaseImpl(this._workspaceRepository);

  final WorkspaceRepository _workspaceRepository;

  @override
  Future<void> call(WorkspaceRegistration workspaceRegistration) async {
    await _workspaceRepository.create(workspaceRegistration);
  }
}
