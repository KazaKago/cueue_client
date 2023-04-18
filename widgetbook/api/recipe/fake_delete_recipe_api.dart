import 'package:cueue/api/hierarchy/recipe/delete_recipe_api.dart';

class FakeDeleteRecipeApi implements DeleteRecipeApi {
  const FakeDeleteRecipeApi();

  @override
  Future<void> call(int recipeId) async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}
