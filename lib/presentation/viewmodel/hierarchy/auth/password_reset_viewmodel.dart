import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/usecase/hierarchy/user/follow_user_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/send_password_reset_mail_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class PasswordResetViewModel with ChangeNotifier {
  PasswordResetViewModel(this._followUserUseCase, this._sendPasswordResetMailUseCase) {
    _follow();
  }

  final FollowUserUseCase _followUserUseCase;
  final SendPasswordResetMailUseCase _sendPasswordResetMailUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  Email? _userEmail;
  bool _isLoading = false;
  Event<void> _completionEvent = Event.initialize();
  Event<Exception> _exceptionEvent = Event.initialize();

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  Email? get userEmail => _userEmail;

  set userEmail(Email? userEmail) {
    _userEmail = userEmail;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Event<void> get completionEvent => _completionEvent;

  set completionEvent(Event<void> completion) {
    _completionEvent = completion;
    notifyListeners();
  }

  Event<Exception> get exceptionEvent => _exceptionEvent;

  set exceptionEvent(Event<Exception> exception) {
    _exceptionEvent = exception;
    notifyListeners();
  }

  void _follow() {
    final followUserUseCase = _followUserUseCase();
    _compositeSubscription.add(
      followUserUseCase.listen((state) {
        state.when(
          loading: (user) {
            // do nothing.
          },
          completed: (user, next, prev) {
            userEmail = user.email;
          },
          error: (exception) {
            // do nothing.
          },
        );
      }),
    );
  }

  Future<void> sendPasswordResetMail(String emailStr) async {
    isLoading = true;
    try {
      await _sendPasswordResetMailUseCase(Email(emailStr));
      completionEvent = Event(null);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }
}
