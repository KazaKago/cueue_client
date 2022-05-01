import 'package:cueue/domain/model/hierarchy/recipe/recipe_search_option.dart';

abstract class RefreshAllRecipesUseCase {
  Future<void> call(RecipeSearchOption searchOption);
}
