import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/use_swr.dart';
import 'package:cueue/model/recipe/recipe.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRState<RecipeId, Recipe> useRecipe(WidgetRef ref, RecipeId recipeId) {
  final getRecipeApi = ref.read(getRecipeApiProvider);
  final recipeResponseMapper = ref.read(recipeResponseMapperProvider);
  final state = useSWR<RecipeId, Recipe>(recipeId, (recipeId) async {
    final response = await getRecipeApi(recipeId: recipeId.value);
    return recipeResponseMapper(response);
  });
  return state;
}
