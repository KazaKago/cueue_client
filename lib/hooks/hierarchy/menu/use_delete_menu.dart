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

class _DeleteMenuData {
  const _DeleteMenuData(this.event, this.menuId);

  final SimpleMessageDialogEvent? event;
  final MenuId menuId;
}

SWRTriggerState<MenuId, void> useDeleteMenu(WidgetRef ref) {
  final intl = useIntl();
  final popPage = usePopPage<EditingResult>();
  final easyLoading = useEasyLoading();
  final showErrorDialog = useShowErrorDialog(ref);
  final deleteMenuApi = ref.read(deleteMenuApiProvider);
  final showConfirmDeleteMenuDialog = useShowSimpleMessageDialog();
  final deleteMenu = useSWRTrigger<MenuId, bool>((menuId) async {
    await deleteMenuApi(menuId.value);
    return true;
  });
  final confirmDeleteMenu = useSWRTrigger<MenuId, _DeleteMenuData>((menuId) async {
    final event = await showConfirmDeleteMenuDialog.trigger(
      SimpleMessageDialogData(
        title: intl.confirm,
        message: intl.confirmDeletingCookingMenu,
        positiveButton: intl.doDelete,
        negativeButton: intl.cancel,
      ),
    );
    return _DeleteMenuData(event, menuId);
  });
  useEffectSWRData<_DeleteMenuData>(confirmDeleteMenu, (data) {
    data.event?.whenOrNull(
      positive: () => deleteMenu.trigger(data.menuId),
    );
  });
  useEffectSWRData(deleteMenu, (data) {
    popPage.trigger(EditingResult.deleted);
  });
  useEffectSWRIsMutating(deleteMenu, ({required isMutating}) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(deleteMenu, (error) {
    showErrorDialog.trigger(error);
  });
  return confirmDeleteMenu;
}
