import 'package:cueue/data/api/hierarchy/menu/get_menu_api.dart';
import 'package:cueue/data/mapper/hierarchy/menu/menu_response_mapper.dart';
import 'package:cueue/data/memory/hierarchy/menu/menu_cache.dart';
import 'package:cueue/data/memory/hierarchy/menu/menu_state_manager.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:store_flowable/store_flowable.dart';

class MenuFlowableFactory implements StoreFlowableFactory<MenuId, Menu> {
  MenuFlowableFactory(this._menuId, this._getMenuApi, this._menuResponseMapper) : super();

  final MenuId _menuId;
  final GetMenuApi _getMenuApi;
  final MenuResponseMapper _menuResponseMapper;

  @override
  MenuId getKey() => _menuId;

  @override
  FlowableDataStateManager<MenuId> getFlowableDataStateManager() => MenuStateManager.sharedInstance;

  @override
  Future<Menu?> loadDataFromCache() async {
    return MenuCache.sharedInstance.menuMap[_menuId];
  }

  @override
  Future<void> saveDataToCache(final Menu? newData) async {
    MenuCache.sharedInstance.menuMap[_menuId] = newData;
    MenuCache.sharedInstance.menuCreatedAtMap[_menuId] = DateTime.now();
  }

  @override
  Future<Menu> fetchDataFromOrigin() async {
    final response = await _getMenuApi.execute(menuId: _menuId.value);
    return _menuResponseMapper.map(response);
  }

  @override
  Future<bool> needRefresh(final Menu cachedData) async {
    final createdAt = MenuCache.sharedInstance.menuCreatedAtMap[_menuId];
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
