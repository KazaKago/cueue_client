import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_registration.dart';
import 'package:cueue/domain/model/hierarchy/menu/time_frame.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/usecase/hierarchy/menu/create_menu_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/menu/delete_menu_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/menu/update_menu_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/editing_result.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class MenuEditingViewModel with ChangeNotifier {
  MenuEditingViewModel(this._createMenuUseCase, this._updateMenuUseCase, this._deleteMenuUseCase);

  final CreateMenuUseCase _createMenuUseCase;
  final UpdateMenuUseCase _updateMenuUseCase;
  final DeleteMenuUseCase _deleteMenuUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  bool _isLoading = false;
  EditingResult? _completion;
  Exception? _exception;

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
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

  bool get isLoading => _isLoading;

  set isLoading(final bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> create(final String memo, final DateTime dateTime, final TimeFrame timeFrame, final List<RecipeId> recipeIds) async {
    isLoading = true;
    try {
      await _createMenuUseCase(MenuRegistration(memo: memo, date: dateTime, timeFrame: timeFrame, recipeIds: recipeIds));
      completion = EditingResult.created;
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> update(final MenuId menuId, final String memo, final DateTime dateTime, final TimeFrame timeFrame, final List<RecipeId> recipeIds) async {
    isLoading = true;
    try {
      await _updateMenuUseCase(menuId, MenuRegistration(memo: memo, date: dateTime, timeFrame: timeFrame, recipeIds: recipeIds));
      completion = EditingResult.updated;
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> delete(final MenuId menuId) async {
    isLoading = true;
    try {
      await _deleteMenuUseCase(menuId);
      completion = EditingResult.deleted;
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }
}
