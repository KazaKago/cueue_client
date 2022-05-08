import 'package:cueue/domain/usecase/hierarchy/workspace/create_workspace_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/foundation.dart';

class WorkspaceCreationViewModel with ChangeNotifier {
  WorkspaceCreationViewModel(this._createWorkspaceUseCase);

  final CreateWorkspaceUseCase _createWorkspaceUseCase;
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

  Future<void> createWorkspace() async {
    isLoading = true;
    try {
      await _createWorkspaceUseCase();
      completionEvent = Event(null);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }
}
