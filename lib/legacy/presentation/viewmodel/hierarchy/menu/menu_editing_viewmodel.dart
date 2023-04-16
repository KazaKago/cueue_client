import 'package:cueue/legacy/domain/usecase/hierarchy/menu/create_menu_usecase.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/menu/delete_menu_usecase.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/menu/update_menu_usecase.dart';
import 'package:cueue/legacy/presentation/viewmodel/global/event.dart';
import 'package:cueue/model/edit/editing_result.dart';
import 'package:cueue/model/menu/menu_id.dart';
import 'package:cueue/model/menu/menu_registration.dart';
import 'package:cueue/model/menu/time_frame.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class MenuEditingViewModel with ChangeNotifier {
  MenuEditingViewModel(this._createMenuUseCase, this._updateMenuUseCase, this._deleteMenuUseCase);

  final CreateMenuUseCase _createMenuUseCase;
  final UpdateMenuUseCase _updateMenuUseCase;
  final DeleteMenuUseCase _deleteMenuUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  bool _isLoading = false;
  Event<EditingResult> _completionEvent = Event.initialize();
  Event<Exception> _exceptionEvent = Event.initialize();

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  Event<EditingResult> get completionEvent => _completionEvent;

  set completionEvent(Event<EditingResult> completion) {
    _completionEvent = completion;
    notifyListeners();
  }

  Event<Exception> get exceptionEvent => _exceptionEvent;

  set exceptionEvent(Event<Exception> exception) {
    _exceptionEvent = exception;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool validate(int recipeCount, String message) {
    return 0 < recipeCount || message.isNotEmpty;
  }

  Future<void> create(String memo, DateTime dateTime, TimeFrame timeFrame, List<RecipeId> recipeIds) async {
    isLoading = true;
    try {
      await _createMenuUseCase(MenuRegistration(memo: memo, date: dateTime, timeFrame: timeFrame, recipeIds: recipeIds));
      completionEvent = Event(EditingResult.created);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> update(MenuId menuId, String memo, DateTime dateTime, TimeFrame timeFrame, List<RecipeId> recipeIds) async {
    isLoading = true;
    try {
      await _updateMenuUseCase(menuId, MenuRegistration(memo: memo, date: dateTime, timeFrame: timeFrame, recipeIds: recipeIds));
      completionEvent = Event(EditingResult.updated);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> delete(MenuId menuId) async {
    isLoading = true;
    try {
      await _deleteMenuUseCase(menuId);
      completionEvent = Event(EditingResult.deleted);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }
}