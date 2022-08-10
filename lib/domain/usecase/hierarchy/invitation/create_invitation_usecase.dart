import 'package:cueue/domain/model/hierarchy/invitation/invitation.dart';

abstract class CreateInvitationUseCase {
  Future<Invitation> call();
}
