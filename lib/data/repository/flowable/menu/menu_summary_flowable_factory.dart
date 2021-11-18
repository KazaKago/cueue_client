import 'package:cueue/data/api/hierarchy/menu/get_menus_api.dart';
import 'package:cueue/data/cache/hierarchy/menu/menu_cache.dart';
import 'package:cueue/data/cache/hierarchy/menu/menu_summary_state_manager.dart';
import 'package:cueue/data/mapper/hierarchy/menu/menu_summary_response_mapper.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_summary.dart';
import 'package:store_flowable/store_flowable.dart';

class MenuSummaryFlowableFactory implements PaginationStoreFlowableFactory<void, List<MenuSummary>> {
  MenuSummaryFlowableFactory(this._menuCache, this._menuSummaryStateManager, this._getMenusApi, this._menuSummaryResponseMapper, this._userFlowableFactory) : super();

  final MenuCache _menuCache;
  final MenuSummaryStateManager _menuSummaryStateManager;
  final GetMenusApi _getMenusApi;
  final MenuSummaryResponseMapper _menuSummaryResponseMapper;
  final UserFlowableFactory _userFlowableFactory;

  @override
  FlowableDataStateManager<void> getFlowableDataStateManager() => _menuSummaryStateManager;

  @override
  Future<List<MenuSummary>?> loadDataFromCache(final void param) async {
    return _menuCache.menuSummaries;
  }

  @override
  Future<void> saveDataToCache(final List<MenuSummary>? newData, final void param) async {
    _menuCache
      ..menuSummaries = newData
      ..menuSummariesCreatedAt = DateTime.now();
  }

  @override
  Future<void> saveNextDataToCache(final List<MenuSummary> cachedData, final List<MenuSummary> newData, final void param) async {
    _menuCache.menuSummaries = cachedData + newData;
  }

  @override
  Future<Fetched<List<MenuSummary>>> fetchDataFromOrigin(final void param) async {
    final user = await _userFlowableFactory.create(null).requireData();
    final response = await _getMenusApi.execute(user.currentWorkspace.id.value, afterId: null);
    final recipes = response.map(_menuSummaryResponseMapper.map).toList();
    return Fetched(
      data: recipes,
      nextKey: recipes.isNotEmpty ? recipes.last.id.value.toString() : null,
    );
  }

  @override
  Future<Fetched<List<MenuSummary>>> fetchNextDataFromOrigin(final String nextKey, final void param) async {
    final user = await _userFlowableFactory.create(null).requireData();
    final response = await _getMenusApi.execute(user.currentWorkspace.id.value, afterId: int.parse(nextKey));
    final recipes = response.map(_menuSummaryResponseMapper.map).toList();
    return Fetched(
      data: recipes,
      nextKey: recipes.isNotEmpty ? recipes.last.id.value.toString() : null,
    );
  }

  @override
  Future<bool> needRefresh(final List<MenuSummary> cachedData, final void param) async {
    final createdAt = _menuCache.menuSummariesCreatedAt;
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
