import 'package:cueue/data/api/hierarchy/menu/create_menu_api.dart';
import 'package:cueue/data/api/hierarchy/menu/delete_menu_api.dart';
import 'package:cueue/data/api/hierarchy/menu/update_menu_api.dart';
import 'package:cueue/data/mapper/hierarchy/menu/menu_request_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/menu/menu_response_mapper.dart';
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
  const MenuRepositoryImpl(this._createMenuApi, this._updateMenuApi, this._deleteMenuApi, this._menuResponseMapper, this._menuRequestMapper, this._menuFlowableFactory, this._menuSummaryFlowableFactory, this._userFlowableFactory);

  final CreateMenuApi _createMenuApi;
  final UpdateMenuApi _updateMenuApi;
  final DeleteMenuApi _deleteMenuApi;
  final MenuResponseMapper _menuResponseMapper;
  final MenuRequestMapper _menuRequestMapper;
  final MenuFlowableFactory _menuFlowableFactory;
  final MenuSummaryFlowableFactory _menuSummaryFlowableFactory;
  final UserFlowableFactory _userFlowableFactory;

  @override
  LoadingStateStream<Menu> followData(MenuId menuId) {
    final menuFlowable = _menuFlowableFactory.create(menuId);
    return menuFlowable.publish();
  }

  @override
  LoadingStateStream<List<MenuSummary>> followAllData() {
    final menuFlowable = _menuSummaryFlowableFactory.create(null);
    return menuFlowable.publish();
  }

  @override
  Future<void> refreshData(MenuId menuId) {
    final menuFlowable = _menuFlowableFactory.create(menuId);
    return menuFlowable.refresh();
  }

  @override
  Future<void> refreshAllData() async {
    final menuFlowable = _menuSummaryFlowableFactory.create(null);
    await menuFlowable.refresh();
  }

  @override
  Future<void> requestAdditionalAllData({required bool continueWhenError}) async {
    final menuFlowable = _menuSummaryFlowableFactory.create(null);
    await menuFlowable.requestNextData(continueWhenError: continueWhenError);
  }

  @override
  Future<void> create(MenuRegistration menuRegistration) async {
    final user = await _userFlowableFactory.create(null).requireData();
    final response = await _createMenuApi.execute(user.currentWorkspace.id.value, _menuRequestMapper.map(menuRegistration));
    final menu = _menuResponseMapper.map(response);

    final menuFlowable = _menuFlowableFactory.create(menu.id);
    await menuFlowable.update(menu);

    final menuSummaryFlowable = _menuSummaryFlowableFactory.create(null);
    final cachedMenuSummaries = await menuSummaryFlowable.getData(from: GettingFrom.cache);
    if (cachedMenuSummaries != null) {
      final menus = ([menu].cast<MenuSummary>() + cachedMenuSummaries)..timedSort();
      await menuSummaryFlowable.update(menus);
    }
  }

  @override
  Future<void> update(MenuId menuId, MenuRegistration menuRegistration) async {
    final user = await _userFlowableFactory.create(null).requireData();
    final response = await _updateMenuApi.execute(user.currentWorkspace.id.value, menuId.value, _menuRequestMapper.map(menuRegistration));
    final menu = _menuResponseMapper.map(response);

    final menuFlowable = _menuFlowableFactory.create(menu.id);
    await menuFlowable.update(menu);

    final menuSummaryFlowable = _menuSummaryFlowableFactory.create(null);
    final cachedMenuSummaries = await menuSummaryFlowable.getData(from: GettingFrom.cache);
    if (cachedMenuSummaries != null) {
      final menuSummaries = (cachedMenuSummaries.map((e) => (e.id == menu.id) ? menu : e).toList())..timedSort();
      await menuSummaryFlowable.update(menuSummaries);
    }
  }

  @override
  Future<void> delete(MenuId menuId) async {
    final user = await _userFlowableFactory.create(null).requireData();
    await _deleteMenuApi.execute(user.currentWorkspace.id.value, menuId.value);

    final menuFlowable = _menuFlowableFactory.create(menuId);
    await menuFlowable.update(null);

    final menuSummaryFlowable = _menuSummaryFlowableFactory.create(null);
    final cachedMenuSummaries = await menuSummaryFlowable.getData(from: GettingFrom.cache);
    if (cachedMenuSummaries != null) {
      final menuSummaries = cachedMenuSummaries.where((e) => e.id != menuId).toList();
      await menuSummaryFlowable.update(menuSummaries);
    }
  }
}
