import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_easy_loading.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/model/edit/editing_result.dart';
import 'package:cueue/model/menu/menu_id.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog_event.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeleteMenuData {
  const DeleteMenuData(this.event, this.menuId);

  final SimpleMessageDialogEvent? event;
  final MenuId menuId;
}

SWRTriggerState<MenuId, void> useDeleteMenu(WidgetRef ref) {
  final intl = useIntl();
  final pop = usePop<EditingResult>();
  final easyLoading = useEasyLoading();
  final showErrorDialog = useShowErrorDialog(ref);
  final deleteMenuApi = ref.read(deleteMenuApiProvider);
  final showConfirmDeleteMenuDialog = useShowSimpleMessageDialog();
  final deleteMenu = useSWRTrigger<MenuId, bool>((menuId) async {
    await deleteMenuApi(menuId.value);
    return true;
  });
  final confirmDeleteMenu = useSWRTrigger<MenuId, DeleteMenuData>((menuId) async {
    final event = await showConfirmDeleteMenuDialog.trigger(
      SimpleMessageDialogData(
        title: intl.confirm,
        message: intl.confirmDeleteCookingMenu,
        positiveButton: intl.doDelete,
        negativeButton: intl.cancel,
      ),
    );
    return DeleteMenuData(event, menuId);
  });
  useEffectSWRData<MenuId, DeleteMenuData>(confirmDeleteMenu, (data) {
    data.event?.whenOrNull(
      positive: () => deleteMenu.trigger(data.menuId),
    );
  });
  useEffectSWRData(deleteMenu, (data) {
    pop.trigger(EditingResult.deleted);
  });
  useEffectSWRIsMutating(deleteMenu, (isMutating) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(deleteMenu, (error) {
    showErrorDialog.trigger(error);
  });
  return confirmDeleteMenu;
}
