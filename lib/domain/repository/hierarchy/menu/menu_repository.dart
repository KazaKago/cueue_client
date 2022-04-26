import 'package:cueue/domain/model/hierarchy/menu/menu.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_registration.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_summary.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class MenuRepository {
  LoadingStateStream<List<MenuSummary>> followAllData();

  LoadingStateStream<Menu> followData(MenuId menuId);

  Future<void> refreshAllData();

  Future<void> refreshData(MenuId menuId);

  Future<void> requestAdditionalAllData({required bool continueWhenError});

  Future<void> create(MenuRegistration menuRegistration);

  Future<void> update(MenuId menuId, MenuRegistration menuRegistration);

  Future<void> delete(MenuId menuId);
}
