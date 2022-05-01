import 'package:cueue/domain/model/hierarchy/recipe/recipe_search_option.dart';

abstract class RequestAdditionalAllRecipesUseCase {
  Future<void> call(RecipeSearchOption searchOption, {required bool continueWhenError});
}
