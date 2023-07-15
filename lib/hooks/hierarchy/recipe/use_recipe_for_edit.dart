import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_immutable.dart';
import 'package:cueue/model/auth/firebase_auth_extension.dart';
import 'package:cueue/model/recipe/recipe.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRState<RecipeId, Recipe> useRecipeForEdit(WidgetRef ref, RecipeId? recipeId, {Recipe? fallbackData}) {
  final getRecipeApi = ref.read(getRecipeApiProvider);
  final recipeResponseMapper = ref.read(recipeResponseMapperProvider);
  final state = useSWRImmutable<RecipeId, Recipe>(
    recipeId,
    (recipeId) async {
      try {
        final response = await getRecipeApi(recipeId: recipeId.value);
        return recipeResponseMapper(response);
      } on auth.FirebaseAuthException catch (exception) {
        throw await exception.parse();
      }
    },
    fallbackData: fallbackData,
  );
  return state;
}
