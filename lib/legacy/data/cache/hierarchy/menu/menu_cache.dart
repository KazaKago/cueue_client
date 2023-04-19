import 'package:cueue/legacy/data/cache/hierarchy/cache.dart';
import 'package:cueue/model/menu/menu_summary.dart';

class MenuCache implements Cache {
  List<MenuSummary>? menuSummaries;
  DateTime? menuSummariesCreatedAt;

  @override
  void clearAll() {
    menuSummaries = null;
    menuSummariesCreatedAt = null;
  }
}
