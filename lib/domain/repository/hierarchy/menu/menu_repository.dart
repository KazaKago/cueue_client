import 'package:cueue/domain/model/hierarchy/menu/menu.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_registration.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_summary.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class MenuRepository {
  LoadingStateStream<List<MenuSummary>> followAllData();

  LoadingStateStream<Menu> followData(final MenuId menuId);

  Future<void> refreshAllData();

  Future<void> refreshData(final MenuId menuId);

  Future<void> requestAdditionalAllData({required final bool continueWhenError});

  Future<void> create(final MenuRegistration menuRegistration);

  Future<void> update(final MenuId menuId, final MenuRegistration menuRegistration);

  Future<void> delete(final MenuId menuId);
}
