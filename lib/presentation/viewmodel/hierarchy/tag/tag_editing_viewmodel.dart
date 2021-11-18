import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_registration.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/create_tag_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/delete_tag_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/update_tag_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/editing_result.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/foundation.dart';

class TagEditingViewModel with ChangeNotifier {
  TagEditingViewModel(this._createTagUseCase, this._updateTagUseCase, this._deleteTagUseCase);

  final CreateTagUseCase _createTagUseCase;
  final UpdateTagUseCase _updateTagUseCase;
  final DeleteTagUseCase _deleteTagUseCase;
  bool _isLoading = false;
  Event<EditingResult> _completionEvent = Event.initialize();
  Event<Exception> _exceptionEvent = Event.initialize();

  bool get isLoading => _isLoading;

  set isLoading(final bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Event<EditingResult> get completionEvent => _completionEvent;

  set completionEvent(final Event<EditingResult> completion) {
    _completionEvent = completion;
    notifyListeners();
  }

  Event<Exception> get exceptionEvent => _exceptionEvent;

  set exceptionEvent(final Event<Exception> exceptionEvent) {
    _exceptionEvent = exceptionEvent;
    notifyListeners();
  }

  Future<void> create(final String name) async {
    isLoading = true;
    try {
      await _createTagUseCase(TagRegistration(name: name));
      completionEvent = Event(EditingResult.created);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> update(final TagId tagId, final String name) async {
    isLoading = true;
    try {
      await _updateTagUseCase(tagId, TagRegistration(name: name));
      completionEvent = Event(EditingResult.updated);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> delete(final TagId tagId) async {
    isLoading = true;
    try {
      await _deleteTagUseCase(tagId);
      completionEvent = Event(EditingResult.deleted);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }
}
