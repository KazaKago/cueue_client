import 'package:cueue/domain/model/hierarchy/invitation/invitation.dart';
import 'package:cueue/domain/repository/hierarchy/invitation/invitation_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/invitation/create_invitation_usecase.dart';

class CreateInvitationUseCaseImpl implements CreateInvitationUseCase {
  const CreateInvitationUseCaseImpl(this._invitationRepository);

  final InvitationRepository _invitationRepository;

  @override
  Future<Invitation> call() async {
    return _invitationRepository.create();
  }
}
