import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_overlay_loading.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog_event.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _DeleteRecipeData {
  const _DeleteRecipeData(this.event, this.recipeId);

  final SimpleMessageDialogEvent? event;
  final RecipeId recipeId;
}

SWRTriggerState<RecipeId, void> useDeleteRecipe(WidgetRef ref) {
  final intl = useIntl();
  final goNamed = useGoNamed();
  final overlayLoading = useOverlayLoading();
  final showErrorDialog = useShowErrorDialog(ref);
  final deleteRecipeApi = ref.read(deleteRecipeApiProvider);
  final showConfirmDeleteRecipeDialog = useShowSimpleMessageDialog();
  final deleteRecipe = useSWRTrigger<RecipeId, bool>((recipeId) async {
    await deleteRecipeApi(recipeId.value);
    return true;
  });
  final confirmDeleteRecipe = useSWRTrigger<RecipeId, _DeleteRecipeData>((recipeId) async {
    final event = await showConfirmDeleteRecipeDialog.trigger(
      SimpleMessageDialogData(
        title: intl.confirm,
        message: intl.confirmDeletingRecipe,
        positiveButton: intl.doDelete,
        negativeButton: intl.cancel,
      ),
    );
    return _DeleteRecipeData(event, recipeId);
  });
  useEffectSWRData<_DeleteRecipeData>(confirmDeleteRecipe, (data) {
    data.event?.whenOrNull(
      positive: () => deleteRecipe.trigger(data.recipeId),
    );
  });
  useEffectSWRData(deleteRecipe, (data) {
    goNamed.trigger(GoName('recipes'));
  });
  useEffectSWRIsMutating(deleteRecipe, ({required isMutating}) {
    overlayLoading.trigger(isMutating);
  });
  useEffectSWRError(deleteRecipe, (error) {
    showErrorDialog.trigger(error);
  });
  return confirmDeleteRecipe;
}
