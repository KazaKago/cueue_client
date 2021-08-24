import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_state.freezed.dart';

@freezed
class RecipeState with _$RecipeState {
  const factory RecipeState.loading() = _Loading;

  const factory RecipeState.loadingWithValue(final List<RecipeSummary> recipes) = _LoadingWithValue;

  const factory RecipeState.completed(final List<RecipeSummary> recipes) = _Completed;

  const factory RecipeState.error(final Exception error) = _Error;

  const factory RecipeState.errorWithValue(final List<RecipeSummary> recipes, final Exception error) = _ErrorWithValue;
}
