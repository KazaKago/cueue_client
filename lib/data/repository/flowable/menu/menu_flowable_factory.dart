import 'package:cueue/data/api/hierarchy/menu/get_menu_api.dart';
import 'package:cueue/data/api/hierarchy/user/get_user_api.dart';
import 'package:cueue/data/mapper/hierarchy/menu/menu_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/data/memory/hierarchy/menu/menu_cache.dart';
import 'package:cueue/data/memory/hierarchy/menu/menu_state_manager.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:store_flowable/store_flowable.dart';

class MenuFlowableFactory implements StoreFlowableFactory<MenuId, Menu> {
  MenuFlowableFactory(this._menuId, this._getUserApi, this._getMenuApi, this._userResponseMapper, this._menuResponseMapper) : super();

  final MenuId _menuId;
  final GetUserApi _getUserApi;
  final GetMenuApi _getMenuApi;
  final UserResponseMapper _userResponseMapper;
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
    final user = await UserFlowableFactory(_getUserApi, _userResponseMapper).create().requireData();
    final response = await _getMenuApi.execute(user.currentWorkspace.id.value, menuId: _menuId.value);
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
