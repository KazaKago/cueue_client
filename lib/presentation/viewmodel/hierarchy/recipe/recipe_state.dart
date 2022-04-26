import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_state.freezed.dart';

@freezed
class RecipeState with _$RecipeState {
  const factory RecipeState.loading() = _Loading;

  const factory RecipeState.refreshing(List<RecipeSummary> menus) = _Refreshing;

  const factory RecipeState.additionalLoading(List<RecipeSummary> menus) = _AdditionalLoading;

  const factory RecipeState.empty() = _Empty;

  const factory RecipeState.completed(List<RecipeSummary> recipes) = _Completed;

  const factory RecipeState.error(Exception error) = _Error;

  const factory RecipeState.additionalError(List<RecipeSummary> recipes, Exception error) = _AdditionalError;
}
