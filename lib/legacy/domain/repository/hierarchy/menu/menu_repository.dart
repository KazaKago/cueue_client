import 'package:cueue/model/menu/menu_summary.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class MenuRepository {
  LoadingStateStream<List<MenuSummary>> followAllData();

  Future<void> refreshAllData();

  Future<void> requestAdditionalAllData({required bool continueWhenError});
}
