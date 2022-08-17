import 'package:cueue/domain/usecase/hierarchy/invitation/create_invitation_usecase.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/invitation/invitation_creation_state.dart';
import 'package:flutter/foundation.dart';

class InvitationCreationViewModel with ChangeNotifier {
  InvitationCreationViewModel(this._createInvitationUseCase) {
    _createInvitation();
  }

  final CreateInvitationUseCase _createInvitationUseCase;
  InvitationCreationState _state = const InvitationCreationState.loading();

  InvitationCreationState get state => _state;

  set state(InvitationCreationState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> _createInvitation() async {
    try {
      state = const InvitationCreationState.loading();
      final invitation = await _createInvitationUseCase();
      state = InvitationCreationState.completed(invitation);
    } on Exception catch (exception) {
      state = InvitationCreationState.error(exception);
    }
  }
}
