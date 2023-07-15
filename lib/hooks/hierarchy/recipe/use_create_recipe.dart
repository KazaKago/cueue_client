import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_easy_loading.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/model/recipe/recipe.dart';
import 'package:cueue/model/recipe/recipe_registration.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<RecipeRegistration, Recipe> useCreateRecipe(WidgetRef ref) {
  final goNamed = useGoNamed();
  final easyLoading = useEasyLoading();
  final showErrorDialog = useShowErrorDialog(ref);
  final createRecipeApi = ref.read(createRecipeApiProvider);
  final recipeRequestMapper = ref.read(recipeRequestMapperProvider);
  final recipeResponseMapper = ref.read(recipeResponseMapperProvider);
  final createRecipe = useSWRTrigger<RecipeRegistration, Recipe>((recipeRegistration) async {
    final response = await createRecipeApi(recipeRequestMapper(recipeRegistration));
    return recipeResponseMapper(response);
  });
  useEffectSWRData(createRecipe, (tag) {
    goNamed.trigger(GoName('recipes'));
  });
  useEffectSWRIsMutating(createRecipe, ({required isMutating}) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(createRecipe, (error) {
    showErrorDialog.trigger(error);
  });
  return createRecipe;
}
