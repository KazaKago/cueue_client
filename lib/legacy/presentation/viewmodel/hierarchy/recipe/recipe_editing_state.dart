import 'package:cueue/model/tag/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_editing_state.freezed.dart';

@freezed
class RecipeEditingState with _$RecipeEditingState {
  const factory RecipeEditingState.loading() = _Loading;

  const factory RecipeEditingState.completed(List<Tag> tags) = _Completed;

  const factory RecipeEditingState.error(Exception error) = _Error;
}
