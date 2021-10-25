import 'package:cueue/data/api/hierarchy/menu/get_menu_api.dart';
import 'package:cueue/data/api/hierarchy/user/get_user_api.dart';
import 'package:cueue/data/cache/hierarchy/menu/menu_cache.dart';
import 'package:cueue/data/cache/hierarchy/menu/menu_state_manager.dart';
import 'package:cueue/data/cache/hierarchy/user/user_cache.dart';
import 'package:cueue/data/cache/hierarchy/user/user_state_manager.dart';
import 'package:cueue/data/mapper/hierarchy/menu/menu_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:store_flowable/store_flowable.dart';

class MenuFlowableFactory implements StoreFlowableFactory<MenuId, Menu> {
  MenuFlowableFactory(this._userCache, this._userStateManager, this._menuCache, this._menuStateManager, this._getUserApi, this._getMenuApi, this._userResponseMapper, this._menuResponseMapper, this._menuId) : super();

  final UserCache _userCache;
  final UserStateManager _userStateManager;
  final MenuCache _menuCache;
  final MenuStateManager _menuStateManager;
  final GetUserApi _getUserApi;
  final GetMenuApi _getMenuApi;
  final UserResponseMapper _userResponseMapper;
  final MenuResponseMapper _menuResponseMapper;
  final MenuId _menuId;

  @override
  MenuId getKey() => _menuId;

  @override
  FlowableDataStateManager<MenuId> getFlowableDataStateManager() => _menuStateManager;

  @override
  Future<Menu?> loadDataFromCache() async {
    return _menuCache.menuMap[_menuId];
  }

  @override
  Future<void> saveDataToCache(final Menu? newData) async {
    _menuCache
      ..menuMap[_menuId] = newData
      ..menuCreatedAtMap[_menuId] = DateTime.now();
  }

  @override
  Future<Menu> fetchDataFromOrigin() async {
    final user = await UserFlowableFactory(_userCache, _userStateManager, _getUserApi, _userResponseMapper).create().requireData();
    final response = await _getMenuApi.execute(user.currentWorkspace.id.value, menuId: _menuId.value);

    hoge(null);
    return _menuResponseMapper.map(response);
  }

  void hoge(final void hoge) {

  }

  @override
  Future<bool> needRefresh(final Menu cachedData) async {
    final createdAt = _menuCache.menuCreatedAtMap[_menuId];
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
