import 'package:cueue/domain/model/hierarchy/recipe/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_detail_state.freezed.dart';

@freezed
class RecipeDetailState with _$RecipeDetailState {
  const factory RecipeDetailState.loading() = _Loading;

  const factory RecipeDetailState.completed(final Recipe recipe) = _Completed;

  const factory RecipeDetailState.error(final Exception error) = _Error;
}
