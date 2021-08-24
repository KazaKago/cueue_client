import 'package:cueue/data/api/request/recipe/recipe_request.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_registration.dart';

class RecipeRequestMapper {
  const RecipeRequestMapper();

  RecipeRequest map(final RecipeRegistration recipeRegistration) {
    return RecipeRequest(
      title: recipeRegistration.title,
      description: recipeRegistration.description,
      url: recipeRegistration.url?.toString(),
      imageKeys: recipeRegistration.imageKeys.map((e) => e.value).toList(),
      tagIds: recipeRegistration.tagIds.map((e) => e.value).toList(),
    );
  }
}
