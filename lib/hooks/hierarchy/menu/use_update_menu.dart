import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_easy_loading.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/model/edit/editing_result.dart';
import 'package:cueue/model/menu/menu.dart';
import 'package:cueue/model/menu/menu_id.dart';
import 'package:cueue/model/menu/menu_registration.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdateMenuData {
  UpdateMenuData(this.tagId, this.menuRegistration);

  final MenuId tagId;
  final MenuRegistration menuRegistration;
}

SWRTriggerState<UpdateMenuData, Menu> useUpdateMenu(WidgetRef ref) {
  final popPage = usePopPage<EditingResult>();
  final easyLoading = useEasyLoading();
  final showErrorDialog = useShowErrorDialog(ref);
  final updateMenuApi = ref.read(updateMenuApiProvider);
  final menuResponseMapper = ref.read(menuResponseMapperProvider);
  final menuRequestMapper = ref.read(menuRequestMapperProvider);
  final updateMenu = useSWRTrigger<UpdateMenuData, Menu>((data) async {
    final response = await updateMenuApi(data.tagId.value, menuRequestMapper(data.menuRegistration));
    return menuResponseMapper(response);
  });
  useEffectSWRData(updateMenu, (data) {
    popPage.trigger(EditingResult.updated);
  });
  useEffectSWRIsMutating(updateMenu, (isMutating) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(updateMenu, (error) {
    showErrorDialog.trigger(error);
  });
  return updateMenu;
}
