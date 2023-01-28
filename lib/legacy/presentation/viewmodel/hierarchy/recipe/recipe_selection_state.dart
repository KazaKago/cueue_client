import 'package:cueue/model/tag/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_selection_state.freezed.dart';

@freezed
class RecipeSelectionState with _$RecipeSelectionState {
  const factory RecipeSelectionState.loading() = _Loading;

  const factory RecipeSelectionState.completed(List<Tag> tags) = _Completed;

  const factory RecipeSelectionState.error(Exception error) = _Error;
}
