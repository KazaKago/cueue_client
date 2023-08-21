import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_overlay_loading.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/model/recipe/recipe.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:cueue/model/recipe/recipe_registration.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdateRecipeData {
  UpdateRecipeData(this.tagId, this.recipeRegistration);

  final RecipeId tagId;
  final RecipeRegistration recipeRegistration;
}

SWRTriggerState<UpdateRecipeData, Recipe> useUpdateRecipe(WidgetRef ref) {
  final goNamed = useGoNamed();
  final overlayLoading = useOverlayLoading();
  final showErrorDialog = useShowErrorDialog(ref);
  final updateRecipeApi = ref.read(updateRecipeApiProvider);
  final recipeResponseMapper = ref.read(recipeResponseMapperProvider);
  final recipeRequestMapper = ref.read(recipeRequestMapperProvider);
  final updateRecipe = useSWRTrigger<UpdateRecipeData, Recipe>((data) async {
    final response = await updateRecipeApi(data.tagId.value, recipeRequestMapper(data.recipeRegistration));
    return recipeResponseMapper(response);
  });
  useEffectSWRData(updateRecipe, (data) {
    goNamed.trigger(GoName('recipes'));
  });
  useEffectSWRIsMutating(updateRecipe, ({required isMutating}) {
    overlayLoading.trigger(isMutating);
  });
  useEffectSWRError(updateRecipe, (error) {
    showErrorDialog.trigger(error);
  });
  return updateRecipe;
}
