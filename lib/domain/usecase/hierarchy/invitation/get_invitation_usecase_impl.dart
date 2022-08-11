import 'package:cueue/domain/model/global/exception/not_found_exception.dart';
import 'package:cueue/domain/model/global/exception/not_found_invitation_exception.dart';
import 'package:cueue/domain/model/hierarchy/invitation/invitation.dart';
import 'package:cueue/domain/model/hierarchy/invitation/invitation_code.dart';
import 'package:cueue/domain/repository/hierarchy/invitation/invitation_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/invitation/get_invitation_usecase.dart';

class GetInvitationUseCaseImpl implements GetInvitationUseCase {
  const GetInvitationUseCaseImpl(this._invitationRepository);

  final InvitationRepository _invitationRepository;

  @override
  Future<Invitation> call(InvitationCode code) async {
    try {
      return await _invitationRepository.get(code);
    } on NotFoundException {
      throw const NotFoundInvitationException();
    }
  }
}
