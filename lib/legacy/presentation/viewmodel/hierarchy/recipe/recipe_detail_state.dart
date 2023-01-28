import 'package:cueue/model/recipe/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_detail_state.freezed.dart';

@freezed
class RecipeDetailState with _$RecipeDetailState {
  const factory RecipeDetailState.loading() = _Loading;

  const factory RecipeDetailState.completed(Recipe recipe) = _Completed;

  const factory RecipeDetailState.error(Exception error) = _Error;
}
