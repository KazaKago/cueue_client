import 'package:cueue/domain/usecase/hierarchy/user/delete_account_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/foundation.dart';

class AccountDeletionViewModel with ChangeNotifier {
  AccountDeletionViewModel(this._deleteAccountUseCase);

  final DeleteAccountUseCase _deleteAccountUseCase;
  bool _isLoading = false;
  Event<void> _replaceWelcomePageEvent = Event.initialize();
  Event<Exception> _exceptionEvent = Event.initialize();

  Event<void> get replaceWelcomePageEvent => _replaceWelcomePageEvent;

  set replaceWelcomePageEvent(Event<void> replaceWelcomePageEvent) {
    _replaceWelcomePageEvent = replaceWelcomePageEvent;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Event<Exception> get exceptionEvent => _exceptionEvent;

  set exceptionEvent(Event<Exception> exceptionEvent) {
    _exceptionEvent = exceptionEvent;
    notifyListeners();
  }

  Future<void> deleteAccount() async {
    isLoading = true;
    try {
      await _deleteAccountUseCase();
      _replaceWelcomePageEvent = Event(null);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }
}
