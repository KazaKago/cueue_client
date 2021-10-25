import 'package:cueue/data/cache/hierarchy/cache.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_summary.dart';

class MenuCache implements Cache {
  Map<MenuId, Menu?> menuMap = {};
  Map<MenuId, DateTime?> menuCreatedAtMap = {};
  List<MenuSummary>? menuSummaries;
  DateTime? menuSummariesCreatedAt;

  @override
  void clearAll() {
    menuMap = {};
    menuCreatedAtMap = {};
    menuSummaries = null;
    menuSummariesCreatedAt = null;
  }
}
