import 'package:cueue/domain/model/hierarchy/user/user_registration.dart';
import 'package:cueue/domain/usecase/hierarchy/user/create_user_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/foundation.dart';

class UserCreationViewModel with ChangeNotifier {
  UserCreationViewModel(this._createUserUseCase);

  final CreateUserUseCase _createUserUseCase;
  bool _isLoading = false;
  Event<void> _completionEvent = Event.initialize();
  Event<Exception> _exceptionEvent = Event.initialize();

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

  Future<void> createUser() async {
    isLoading = true;
    try {
      const registration = UserRegistration(displayName: 'Kensuke Tamura', photoKey: null); // TODO
      await _createUserUseCase(registration);
      completionEvent = Event(null);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }
}
