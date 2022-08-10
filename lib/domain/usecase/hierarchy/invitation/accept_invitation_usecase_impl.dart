import 'package:cueue/domain/model/hierarchy/invitation/invitation_code.dart';
import 'package:cueue/domain/repository/hierarchy/invitation/invitation_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/invitation/accept_invitation_usecase.dart';

class AcceptInvitationUseCaseImpl implements AcceptInvitationUseCase {
  const AcceptInvitationUseCaseImpl(this._invitationRepository);

  final InvitationRepository _invitationRepository;

  @override
  Future<void> call(InvitationCode code) async {
    await _invitationRepository.accept(code);
  }
}
