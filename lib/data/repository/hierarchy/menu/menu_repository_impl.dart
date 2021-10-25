import 'package:cueue/data/api/hierarchy/menu/create_menu_api.dart';
import 'package:cueue/data/api/hierarchy/menu/delete_menu_api.dart';
import 'package:cueue/data/api/hierarchy/menu/get_menu_api.dart';
import 'package:cueue/data/api/hierarchy/menu/get_menus_api.dart';
import 'package:cueue/data/api/hierarchy/menu/update_menu_api.dart';
import 'package:cueue/data/api/hierarchy/user/get_user_api.dart';
import 'package:cueue/data/cache/hierarchy/menu/menu_cache.dart';
import 'package:cueue/data/cache/hierarchy/menu/menu_state_manager.dart';
import 'package:cueue/data/cache/hierarchy/menu/menu_summary_state_manager.dart';
import 'package:cueue/data/cache/hierarchy/user/user_cache.dart';
import 'package:cueue/data/cache/hierarchy/user/user_state_manager.dart';
import 'package:cueue/data/mapper/hierarchy/menu/menu_request_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/menu/menu_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/menu/menu_summary_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/data/repository/flowable/menu/menu_flowable_factory.dart';
import 'package:cueue/data/repository/flowable/menu/menu_summary_flowable_factory.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_registration.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_summary.dart';
import 'package:cueue/domain/model/hierarchy/menu/menus_extension.dart';
import 'package:cueue/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:store_flowable/store_flowable.dart';

class MenuRepositoryImpl implements MenuRepository {
  const MenuRepositoryImpl(this._userCache, this._userStateManager, this._menuCache, this._menuStateManager, this._menuSummaryStateManager, this._getUserApi, this._getMenuApi, this._getMenusApi, this._createMenuApi, this._updateMenuApi, this._deleteMenuApi, this._userResponseMapper, this._menuSummaryResponseMapper, this._menuResponseMapper, this._menuRequestMapper);

  final UserCache _userCache;
  final UserStateManager _userStateManager;
  final MenuCache _menuCache;
  final MenuStateManager _menuStateManager;
  final MenuSummaryStateManager _menuSummaryStateManager;
  final GetUserApi _getUserApi;
  final GetMenuApi _getMenuApi;
  final GetMenusApi _getMenusApi;
  final CreateMenuApi _createMenuApi;
  final UpdateMenuApi _updateMenuApi;
  final DeleteMenuApi _deleteMenuApi;
  final UserResponseMapper _userResponseMapper;
  final MenuSummaryResponseMapper _menuSummaryResponseMapper;
  final MenuResponseMapper _menuResponseMapper;
  final MenuRequestMapper _menuRequestMapper;

  @override
  Future<LoadingStateStream<Menu>> followData(final MenuId menuId) async {
    final menuFlowable = MenuFlowableFactory(_userCache, _userStateManager, _menuCache, _menuStateManager, _getUserApi, _getMenuApi, _userResponseMapper, _menuResponseMapper, menuId).create();
    return menuFlowable.publish();
  }

  @override
  Future<LoadingStateStream<List<MenuSummary>>> followAllData() async {
    final menuFlowable = MenuSummaryFlowableFactory(_userCache, _userStateManager, _menuCache, _menuSummaryStateManager, _getUserApi, _getMenusApi, _userResponseMapper, _menuSummaryResponseMapper).create();
    return menuFlowable.publish();
  }

  @override
  Future<void> refreshData(final MenuId menuId) {
    final menuFlowable = MenuFlowableFactory(_userCache, _userStateManager, _menuCache, _menuStateManager, _getUserApi, _getMenuApi, _userResponseMapper, _menuResponseMapper, menuId).create();
    return menuFlowable.refresh();
  }

  @override
  Future<void> refreshAllData() async {
    final menuFlowable = MenuSummaryFlowableFactory(_userCache, _userStateManager, _menuCache, _menuSummaryStateManager, _getUserApi, _getMenusApi, _userResponseMapper, _menuSummaryResponseMapper).create();
    await menuFlowable.refresh();
  }

  @override
  Future<void> requestAdditionalAllData({required final bool continueWhenError}) async {
    final menuFlowable = MenuSummaryFlowableFactory(_userCache, _userStateManager, _menuCache, _menuSummaryStateManager, _getUserApi, _getMenusApi, _userResponseMapper, _menuSummaryResponseMapper).create();
    await menuFlowable.requestNextData(continueWhenError: continueWhenError);
  }

  @override
  Future<void> create(final MenuRegistration menuRegistration) async {
    final user = await UserFlowableFactory(_userCache, _userStateManager, _getUserApi, _userResponseMapper).create().requireData();
    final response = await _createMenuApi.execute(user.currentWorkspace.id.value, _menuRequestMapper.map(menuRegistration));
    final menu = _menuResponseMapper.map(response);

    final menuFlowable = MenuFlowableFactory(_userCache, _userStateManager, _menuCache, _menuStateManager, _getUserApi, _getMenuApi, _userResponseMapper, _menuResponseMapper, menu.id).create();
    await menuFlowable.update(menu);

    final menuSummaryFlowable = MenuSummaryFlowableFactory(_userCache, _userStateManager, _menuCache, _menuSummaryStateManager, _getUserApi, _getMenusApi, _userResponseMapper, _menuSummaryResponseMapper).create();
    final cachedMenuSummaries = await menuSummaryFlowable.getData(from: GettingFrom.cache);
    if (cachedMenuSummaries != null) {
      final menus = ([menu].cast<MenuSummary>() + cachedMenuSummaries)..timedSort();
      await menuSummaryFlowable.update(menus);
    }
  }

  @override
  Future<void> update(final MenuId menuId, final MenuRegistration menuRegistration) async {
    final user = await UserFlowableFactory(_userCache, _userStateManager, _getUserApi, _userResponseMapper).create().requireData();
    final response = await _updateMenuApi.execute(user.currentWorkspace.id.value, menuId.value, _menuRequestMapper.map(menuRegistration));
    final menu = _menuResponseMapper.map(response);

    final menuFlowable = MenuFlowableFactory(_userCache, _userStateManager, _menuCache, _menuStateManager, _getUserApi, _getMenuApi, _userResponseMapper, _menuResponseMapper, menu.id).create();
    await menuFlowable.update(menu);

    final menuSummaryFlowable = MenuSummaryFlowableFactory(_userCache, _userStateManager, _menuCache, _menuSummaryStateManager, _getUserApi, _getMenusApi, _userResponseMapper, _menuSummaryResponseMapper).create();
    final cachedMenuSummaries = await menuSummaryFlowable.getData(from: GettingFrom.cache);
    if (cachedMenuSummaries != null) {
      final menuSummaries = (cachedMenuSummaries.map((e) => (e.id == menu.id) ? menu : e).toList())..timedSort();
      await menuSummaryFlowable.update(menuSummaries);
    }
  }

  @override
  Future<void> delete(final MenuId menuId) async {
    final user = await UserFlowableFactory(_userCache, _userStateManager, _getUserApi, _userResponseMapper).create().requireData();
    await _deleteMenuApi.execute(user.currentWorkspace.id.value, menuId.value);

    final menuFlowable = MenuFlowableFactory(_userCache, _userStateManager, _menuCache, _menuStateManager, _getUserApi, _getMenuApi, _userResponseMapper, _menuResponseMapper, menuId).create();
    await menuFlowable.update(null);

    final menuSummaryFlowable = MenuSummaryFlowableFactory(_userCache, _userStateManager, _menuCache, _menuSummaryStateManager, _getUserApi, _getMenusApi, _userResponseMapper, _menuSummaryResponseMapper).create();
    final cachedMenuSummaries = await menuSummaryFlowable.getData(from: GettingFrom.cache);
    if (cachedMenuSummaries != null) {
      final menuSummaries = cachedMenuSummaries.where((e) => e.id != menuId).toList();
      await menuSummaryFlowable.update(menuSummaries);
    }
  }
}
