import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_overlay_loading.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/model/menu/menu.dart';
import 'package:cueue/model/menu/menu_registration.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<MenuRegistration, Menu> useCreateMenu(WidgetRef ref) {
  final goNamed = useGoNamed();
  final overlayLoading = useOverlayLoading();
  final showErrorDialog = useShowErrorDialog(ref);
  final createMenuApi = ref.read(createMenuApiProvider);
  final menuRequestMapper = ref.read(menuRequestMapperProvider);
  final menuResponseMapper = ref.read(menuResponseMapperProvider);
  final createMenu = useSWRTrigger<MenuRegistration, Menu>((menuRegistration) async {
    final response = await createMenuApi(menuRequestMapper(menuRegistration));
    return menuResponseMapper(response);
  });
  useEffectSWRData(createMenu, (tag) {
    goNamed.trigger(GoName('menus'));
  });
  useEffectSWRIsMutating(createMenu, ({required isMutating}) {
    overlayLoading.trigger(isMutating);
  });
  useEffectSWRError(createMenu, (error) {
    showErrorDialog.trigger(error);
  });
  return createMenu;
}
