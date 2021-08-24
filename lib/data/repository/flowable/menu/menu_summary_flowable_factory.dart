import 'package:cueue/data/api/hierarchy/menu/get_menus_api.dart';
import 'package:cueue/data/mapper/hierarchy/menu/menu_summary_response_mapper.dart';
import 'package:cueue/data/memory/hierarchy/menu/menu_cache.dart';
import 'package:cueue/data/memory/hierarchy/menu/menu_summary_state_manager.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_summary.dart';
import 'package:store_flowable/store_flowable.dart';

class MenuSummaryFlowableFactory implements PaginationStoreFlowableFactory<void, List<MenuSummary>> {
  MenuSummaryFlowableFactory(this._getMenusApi, this._menuResponseMapper) : super();

  final GetMenusApi _getMenusApi;
  final MenuSummaryResponseMapper _menuResponseMapper;

  @override
  void getKey() {}

  @override
  FlowableDataStateManager<void> getFlowableDataStateManager() => MenuSummaryStateManager.sharedInstance;

  @override
  Future<List<MenuSummary>?> loadDataFromCache() async {
    return MenuCache.sharedInstance.menuSummaries;
  }

  @override
  Future<void> saveDataToCache(final List<MenuSummary>? newData) async {
    MenuCache.sharedInstance.menuSummaries = newData;
    MenuCache.sharedInstance.menuSummariesCreatedAt = DateTime.now();
  }

  @override
  Future<void> saveNextDataToCache(final List<MenuSummary> cachedData, final List<MenuSummary> newData) async {
    MenuCache.sharedInstance.menuSummaries = cachedData + newData;
  }

  @override
  Future<Fetched<List<MenuSummary>>> fetchDataFromOrigin() async {
    final response = await _getMenusApi.execute(afterId: null);
    final recipes = response.map(_menuResponseMapper.map).toList();
    return Fetched(
      data: recipes,
      nextKey: recipes.isNotEmpty ? recipes.last.id.value.toString() : null,
    );
  }

  @override
  Future<Fetched<List<MenuSummary>>> fetchNextDataFromOrigin(final String nextKey) async {
    final response = await _getMenusApi.execute(afterId: int.parse(nextKey));
    final recipes = response.map(_menuResponseMapper.map).toList();
    return Fetched(
      data: recipes,
      nextKey: recipes.isNotEmpty ? recipes.last.id.value.toString() : null,
    );
  }

  @override
  Future<bool> needRefresh(final List<MenuSummary> cachedData) async {
    final createdAt = MenuCache.sharedInstance.menuSummariesCreatedAt;
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
