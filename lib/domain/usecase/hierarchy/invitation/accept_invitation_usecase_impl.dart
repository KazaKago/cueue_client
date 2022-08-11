import 'package:cueue/domain/model/global/exception/not_found_exception.dart';
import 'package:cueue/domain/model/global/exception/not_found_invitation_exception.dart';
import 'package:cueue/domain/model/hierarchy/invitation/invitation_code.dart';
import 'package:cueue/domain/repository/hierarchy/invitation/invitation_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/invitation/accept_invitation_usecase.dart';

class AcceptInvitationUseCaseImpl implements AcceptInvitationUseCase {
  const AcceptInvitationUseCaseImpl(this._invitationRepository);

  final InvitationRepository _invitationRepository;

  @override
  Future<void> call(InvitationCode code) async {
    try {
      await _invitationRepository.accept(code);
    } on NotFoundException {
      throw const NotFoundInvitationException();
    }
  }
}
