import 'package:cueue/data/api/hierarchy/menu/get_menu_api.dart';
import 'package:cueue/data/cache/hierarchy/menu/menu_cache.dart';
import 'package:cueue/data/cache/hierarchy/menu/menu_state_manager.dart';
import 'package:cueue/data/mapper/hierarchy/menu/menu_response_mapper.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:store_flowable/store_flowable.dart';

class MenuFlowableFactory implements StoreFlowableFactory<MenuId, Menu> {
  MenuFlowableFactory(this._menuCache, this._menuStateManager, this._getMenuApi, this._menuResponseMapper) : super();

  final MenuCache _menuCache;
  final MenuStateManager _menuStateManager;
  final GetMenuApi _getMenuApi;
  final MenuResponseMapper _menuResponseMapper;

  @override
  FlowableDataStateManager<MenuId> getFlowableDataStateManager() => _menuStateManager;

  @override
  Future<Menu?> loadDataFromCache(MenuId param) async {
    return _menuCache.menuMap[param];
  }

  @override
  Future<void> saveDataToCache(Menu? newData, MenuId param) async {
    _menuCache
      ..menuMap[param] = newData
      ..menuCreatedAtMap[param] = DateTime.now();
  }

  @override
  Future<Menu> fetchDataFromOrigin(MenuId param) async {
    final response = await _getMenuApi.execute(menuId: param.value);
    return _menuResponseMapper.map(response);
  }

  @override
  Future<bool> needRefresh(Menu cachedData, MenuId param) async {
    final createdAt = _menuCache.menuCreatedAtMap[param];
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
