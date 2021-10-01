import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_state.freezed.dart';

@freezed
class RecipeState with _$RecipeState {
  const factory RecipeState.loading() = _Loading;

  const factory RecipeState.refreshing(final List<RecipeSummary> menus) = _Refreshing;

  const factory RecipeState.additionalLoading(final List<RecipeSummary> menus) = _AdditionalLoading;

  const factory RecipeState.empty() = _Empty;

  const factory RecipeState.completed(final List<RecipeSummary> recipes) = _Completed;

  const factory RecipeState.error(final Exception error) = _Error;

  const factory RecipeState.additionalError(final List<RecipeSummary> recipes, final Exception error) = _AdditionalError;
}
