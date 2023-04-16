import 'package:cueue/api/hierarchy/menu/get_menus_api.dart';
import 'package:cueue/legacy/data/cache/hierarchy/menu/menu_cache.dart';
import 'package:cueue/legacy/data/cache/hierarchy/menu/menu_summary_state_manager.dart';
import 'package:cueue/mapper/menu/menu_summary_response_mapper.dart';
import 'package:cueue/model/menu/menu_summary.dart';
import 'package:store_flowable/store_flowable.dart';

class MenuSummaryFlowableFactory implements PaginationStoreFlowableFactory<void, List<MenuSummary>> {
  MenuSummaryFlowableFactory(this._menuCache, this._menuSummaryStateManager, this._getMenusApi, this._menuSummaryResponseMapper) : super();

  final MenuCache _menuCache;
  final MenuSummaryStateManager _menuSummaryStateManager;
  final GetMenusApi _getMenusApi;
  final MenuSummaryResponseMapper _menuSummaryResponseMapper;

  @override
  FlowableDataStateManager<void> getFlowableDataStateManager() => _menuSummaryStateManager;

  @override
  Future<List<MenuSummary>?> loadDataFromCache(void param) async {
    return _menuCache.menuSummaries;
  }

  @override
  Future<void> saveDataToCache(List<MenuSummary>? newData, void param) async {
    _menuCache
      ..menuSummaries = newData
      ..menuSummariesCreatedAt = DateTime.now();
  }

  @override
  Future<void> saveNextDataToCache(List<MenuSummary> cachedData, List<MenuSummary> newData, void param) async {
    _menuCache.menuSummaries = cachedData + newData;
  }

  @override
  Future<Fetched<List<MenuSummary>>> fetchDataFromOrigin(void param) async {
    final response = await _getMenusApi();
    final recipes = response.map(_menuSummaryResponseMapper.call).toList();
    return Fetched(
      data: recipes,
      nextKey: recipes.isNotEmpty ? recipes.last.id.value.toString() : null,
    );
  }

  @override
  Future<Fetched<List<MenuSummary>>> fetchNextDataFromOrigin(String nextKey, void param) async {
    final response = await _getMenusApi(afterId: int.parse(nextKey));
    final recipes = response.map(_menuSummaryResponseMapper.call).toList();
    return Fetched(
      data: recipes,
      nextKey: recipes.isNotEmpty ? recipes.last.id.value.toString() : null,
    );
  }

  @override
  Future<bool> needRefresh(List<MenuSummary> cachedData, void param) async {
    final createdAt = _menuCache.menuSummariesCreatedAt;
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}