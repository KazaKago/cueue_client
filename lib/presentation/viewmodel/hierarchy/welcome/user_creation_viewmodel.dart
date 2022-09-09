import 'package:cueue/domain/model/hierarchy/content/content_key.dart';
import 'package:cueue/domain/model/hierarchy/content/content_registration.dart';
import 'package:cueue/domain/model/hierarchy/user/pre_user.dart';
import 'package:cueue/domain/model/hierarchy/user/user_registration.dart';
import 'package:cueue/domain/usecase/hierarchy/content/create_content_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/create_user_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/get_pre_user_info_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:cueue/presentation/viewmodel/global/ui_state.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart';

class UserCreationViewModel with ChangeNotifier {
  UserCreationViewModel(this._getPreUserInfoUseCase, this._createContentUseCase, this._createUserUseCase) {
    getPreUserInfo();
  }

  final GetPreUserInfoUseCase _getPreUserInfoUseCase;
  final CreateContentUseCase _createContentUseCase;
  final CreateUserUseCase _createUserUseCase;
  UiState<PreUser> _uiState = UiState.initialize();
  bool _isLoading = false;
  Event<void> _completionEvent = Event.initialize();
  Event<Exception> _exceptionEvent = Event.initialize();

  UiState<PreUser> get uiState => _uiState;

  set uiState(UiState<PreUser> uiState) {
    _uiState = uiState;
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

  Future<void> getPreUserInfo() async {
    try {
      uiState = const UiState.loading();
      final preUser = await _getPreUserInfoUseCase();
      uiState = UiState.completed(value: preUser);
    } on Exception catch (_) {
      uiState = const UiState.completed(value: PreUser(displayName: '', photo: null));
    }
  }

  Future<void> updatePhoto(File imageFile) async {
    isLoading = true;
    try {
      final content = await _createContentUseCase.call(ContentRegistration.file(file: imageFile));
      final preUser = uiState.getValue();
      if (preUser != null) uiState = UiState.completed(value: preUser.copyWith(photo: content));
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  void updateName(String name) {
    final preUser = uiState.getValue();
    if (preUser != null) uiState = UiState.completed(value: preUser.copyWith(displayName: name));
  }

  Future<void> createUser(String displayName, ContentKey? photoKey) async {
    isLoading = true;
    try {
      final registration = UserRegistration(displayName: displayName, photoKey: photoKey);
      await _createUserUseCase(registration);
      completionEvent = Event(null);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }
}
