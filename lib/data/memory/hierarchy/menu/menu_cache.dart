import 'package:cueue/domain/model/hierarchy/menu/menu.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_summary.dart';

class MenuCache {
  static MenuCache sharedInstance = MenuCache();

  Map<MenuId, Menu?> menuMap = {};
  Map<MenuId, DateTime?> menuCreatedAtMap = {};
  List<MenuSummary>? menuSummaries;
  DateTime? menuSummariesCreatedAt;

  void clearAll() {
    menuMap = {};
    menuCreatedAtMap = {};
    menuSummaries = null;
    menuSummariesCreatedAt = null;
  }
}
