import 'package:cueue/legacy/data/repository/flowable/menu/menu_summary_flowable_factory.dart';
import 'package:cueue/legacy/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:cueue/model/menu/menu_summary.dart';
import 'package:store_flowable/store_flowable.dart';

class MenuRepositoryImpl implements MenuRepository {
  const MenuRepositoryImpl(this._menuSummaryFlowableFactory);

  final MenuSummaryFlowableFactory _menuSummaryFlowableFactory;

  @override
  LoadingStateStream<List<MenuSummary>> followAllData() {
    final menuFlowable = _menuSummaryFlowableFactory.create(null);
    return menuFlowable.publish();
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
}
