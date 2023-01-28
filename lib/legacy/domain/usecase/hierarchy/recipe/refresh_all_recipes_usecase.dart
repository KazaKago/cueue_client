import 'package:cueue/model/recipe/recipe_search_option.dart';

abstract class RefreshAllRecipesUseCase {
  Future<void> call(RecipeSearchOption searchOption);
}
