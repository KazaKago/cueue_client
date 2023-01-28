import 'package:cueue/model/recipe/recipe_search_option.dart';

abstract class RequestAdditionalAllRecipesUseCase {
  Future<void> call(RecipeSearchOption searchOption, {required bool continueWhenError});
}
