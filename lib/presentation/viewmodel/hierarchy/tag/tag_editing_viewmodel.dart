import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_registration.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/create_tag_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/delete_tag_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/update_tag_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/editing_result.dart';
import 'package:flutter/foundation.dart';

class TagEditingViewModel with ChangeNotifier {
  TagEditingViewModel(this._createTagUseCase, this._updateTagUseCase, this._deleteTagUseCase);

  final CreateTagUseCase _createTagUseCase;
  final UpdateTagUseCase _updateTagUseCase;
  final DeleteTagUseCase _deleteTagUseCase;
  bool _isLoading = false;
  EditingResult? _completion;
  Exception? _exception;

  bool get isLoading => _isLoading;

  set isLoading(final bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  EditingResult? get completion => _completion;

  set completion(final EditingResult? completion) {
    _completion = completion;
    notifyListeners();
  }

  Exception? get exception => _exception;

  set exception(final Exception? exception) {
    _exception = exception;
    notifyListeners();
  }

  Future<void> create(final String name) async {
    isLoading = true;
    try {
      await _createTagUseCase(TagRegistration(name: name));
      completion = EditingResult.created;
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> update(final TagId tagId, final String name) async {
    isLoading = true;
    try {
      await _updateTagUseCase(tagId, TagRegistration(name: name));
      completion = EditingResult.updated;
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> delete(final TagId tagId) async {
    isLoading = true;
    try {
      await _deleteTagUseCase(tagId);
      completion = EditingResult.deleted;
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }
}
