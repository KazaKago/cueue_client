import 'package:cueue/domain/model/hierarchy/invitation/invitation_code.dart';
import 'package:cueue/domain/usecase/hierarchy/invitation/accept_invitation_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/invitation/get_invitation_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/invitation/invitation_info_state.dart';
import 'package:flutter/foundation.dart';

class InvitationInfoViewModel with ChangeNotifier {
  InvitationInfoViewModel(this._getInvitationUseCase, this._acceptInvitationUseCase, this.code) {
    _getInvitation();
  }

  final InvitationCode code;
  final GetInvitationUseCase _getInvitationUseCase;
  final AcceptInvitationUseCase _acceptInvitationUseCase;
  InvitationInfoState _state = const InvitationInfoState.loading();
  bool _isLoading = false;
  Event<void> _completionEvent = Event.initialize();
  Event<Exception> _exceptionEvent = Event.initialize();

  InvitationInfoState get state => _state;

  set state(InvitationInfoState state) {
    _state = state;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Event<void> get completionEvent => _completionEvent;

  set completionEvent(Event<void> completionEvent) {
    _completionEvent = completionEvent;
    notifyListeners();
  }

  Event<Exception> get exceptionEvent => _exceptionEvent;

  set exceptionEvent(Event<Exception> exception) {
    _exceptionEvent = exception;
    notifyListeners();
  }

  Future<void> _getInvitation() async {
    try {
      state = const InvitationInfoState.loading();
      final invitation = await _getInvitationUseCase(code);
      state = InvitationInfoState.completed(invitation);
    } on Exception catch (exception) {
      state = InvitationInfoState.error(exception);
    }
  }

  Future<void> acceptInvitation() async {
    isLoading = true;
    try {
      await _acceptInvitationUseCase(code);
      completionEvent = Event(null);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }
}
