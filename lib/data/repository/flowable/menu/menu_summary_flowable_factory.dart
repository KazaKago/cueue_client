import 'package:cueue/data/api/hierarchy/menu/get_menus_api.dart';
import 'package:cueue/data/api/hierarchy/user/get_user_api.dart';
import 'package:cueue/data/cache/hierarchy/menu/menu_cache.dart';
import 'package:cueue/data/cache/hierarchy/menu/menu_summary_state_manager.dart';
import 'package:cueue/data/cache/hierarchy/user/user_cache.dart';
import 'package:cueue/data/cache/hierarchy/user/user_state_manager.dart';
import 'package:cueue/data/mapper/hierarchy/menu/menu_summary_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_summary.dart';
import 'package:store_flowable/store_flowable.dart';

class MenuSummaryFlowableFactory implements PaginationStoreFlowableFactory<void, List<MenuSummary>> {
  MenuSummaryFlowableFactory(this._userCache, this._userStateManager, this._menuCache, this._menuSummaryStateManager, this._getUserApi, this._getMenusApi, this._userResponseMapper, this._menuResponseMapper) : super();

  final UserCache _userCache;
  final UserStateManager _userStateManager;
  final MenuCache _menuCache;
  final MenuSummaryStateManager _menuSummaryStateManager;
  final GetUserApi _getUserApi;
  final GetMenusApi _getMenusApi;
  final UserResponseMapper _userResponseMapper;
  final MenuSummaryResponseMapper _menuResponseMapper;

  @override
  void getKey() {}

  @override
  FlowableDataStateManager<void> getFlowableDataStateManager() => _menuSummaryStateManager;

  @override
  Future<List<MenuSummary>?> loadDataFromCache() async {
    return _menuCache.menuSummaries;
  }

  @override
  Future<void> saveDataToCache(final List<MenuSummary>? newData) async {
    _menuCache
      ..menuSummaries = newData
      ..menuSummariesCreatedAt = DateTime.now();
  }

  @override
  Future<void> saveNextDataToCache(final List<MenuSummary> cachedData, final List<MenuSummary> newData) async {
    _menuCache.menuSummaries = cachedData + newData;
  }

  @override
  Future<Fetched<List<MenuSummary>>> fetchDataFromOrigin() async {
    final user = await UserFlowableFactory(_userCache, _userStateManager, _getUserApi, _userResponseMapper).create().requireData();
    final response = await _getMenusApi.execute(user.currentWorkspace.id.value, afterId: null);
    final recipes = response.map(_menuResponseMapper.map).toList();
    return Fetched(
      data: recipes,
      nextKey: recipes.isNotEmpty ? recipes.last.id.value.toString() : null,
    );
  }

  @override
  Future<Fetched<List<MenuSummary>>> fetchNextDataFromOrigin(final String nextKey) async {
    final user = await UserFlowableFactory(_userCache, _userStateManager, _getUserApi, _userResponseMapper).create().requireData();
    final response = await _getMenusApi.execute(user.currentWorkspace.id.value, afterId: int.parse(nextKey));
    final recipes = response.map(_menuResponseMapper.map).toList();
    return Fetched(
      data: recipes,
      nextKey: recipes.isNotEmpty ? recipes.last.id.value.toString() : null,
    );
  }

  @override
  Future<bool> needRefresh(final List<MenuSummary> cachedData) async {
    final createdAt = _menuCache.menuSummariesCreatedAt;
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
