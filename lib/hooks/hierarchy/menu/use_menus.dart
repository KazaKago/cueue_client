import 'package:cueue/hooks/global/swr/swr_infinite_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_infinite.dart';
import 'package:cueue/model/menu/menu_summary.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

String? _getKey(int pageIndex, List<MenuSummary>? previousPageData) {
  if (previousPageData?.isEmpty == true) {
    return null;
  } else {
    return 'menus/${previousPageData?.last.id.value}';
  }
}

SWRInfiniteState<String, List<MenuSummary>> useMenus(WidgetRef ref) {
  final getMenusApi = ref.read(getMenusApiProvider);
  final menuSummaryResponseMapper = ref.read(menuSummaryResponseMapperProvider);
  final state = useSWRInfinite<String, List<MenuSummary>>(_getKey, (key) async {
    final afterId = int.tryParse(key.split('/').last);
    final response = await getMenusApi(afterId: afterId);
    return response.map(menuSummaryResponseMapper.call).toList();
  });
  return state;
}
