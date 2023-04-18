import 'package:cueue/model/menu/menu_id.dart';
import 'package:cueue/model/menu/menu_registration.dart';
import 'package:cueue/model/menu/menu_summary.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class MenuRepository {
  LoadingStateStream<List<MenuSummary>> followAllData();

  Future<void> refreshAllData();

  Future<void> requestAdditionalAllData({required bool continueWhenError});

  Future<void> create(MenuRegistration menuRegistration);

  Future<void> update(MenuId menuId, MenuRegistration menuRegistration);

  Future<void> delete(MenuId menuId);
}
