import 'package:cueue/domain/model/hierarchy/invitation/invitation.dart';
import 'package:cueue/domain/model/hierarchy/invitation/invitation_code.dart';
import 'package:cueue/domain/repository/hierarchy/invitation/invitation_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/invitation/get_invitation_usecase.dart';

class GetInvitationUseCaseImpl implements GetInvitationUseCase {
  const GetInvitationUseCaseImpl(this._invitationRepository);

  final InvitationRepository _invitationRepository;

  @override
  Future<Invitation> call(InvitationCode code) {
    return _invitationRepository.get(code);
  }
}
