import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/use_swr.dart';
import 'package:cueue/model/menu/menu.dart';
import 'package:cueue/model/menu/menu_id.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRState<MenuId, Menu> useGetMenu(WidgetRef ref, MenuId menuId) {
  final getMenuApi = ref.read(getMenuApiProvider);
  final menuResponseMapper = ref.read(menuResponseMapperProvider);
  final state = useSWR<MenuId, Menu>(menuId, (menuId) async {
    final response = await getMenuApi(menuId: menuId.value);
    return menuResponseMapper.call(response);
  });
  return state;
}
