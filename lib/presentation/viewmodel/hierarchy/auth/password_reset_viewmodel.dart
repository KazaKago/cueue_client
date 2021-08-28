import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/usecase/hierarchy/user/follow_user_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/send_password_reset_mail_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/unit.dart';
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
  Unit? _completion;
  Exception? _exception;

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  Email? get userEmail => _userEmail;

  set userEmail(final Email? userEmail) {
    _userEmail = userEmail;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(final bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Unit? get completion => _completion;

  set completion(final Unit? completion) {
    _completion = completion;
    notifyListeners();
  }

  Exception? get exception => _exception;

  set exception(final Exception? exception) {
    _exception = exception;
    notifyListeners();
  }

  Future<void> _follow() async {
    final followUserUseCase = await _followUserUseCase();
    _compositeSubscription.add(followUserUseCase.listen((state) {
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
    }));
  }

  Future<void> sendPasswordResetMail(final String emailStr) async {
    isLoading = true;
    try {
      await _sendPasswordResetMailUseCase(Email(emailStr));
      completion = const Unit();
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }
}
