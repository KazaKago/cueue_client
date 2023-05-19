import 'package:collection/collection.dart';
import 'package:cueue/model/date/date_time_extension.dart';
import 'package:cueue/model/menu/date_split_menu_list.dart';
import 'package:cueue/model/menu/menu_summary.dart';

class MenuList extends DelegatingList<MenuSummary?> {
  MenuList(super.base);

  factory MenuList.from(List<List<MenuSummary>?> nestedMenuSummaries) {
    final mergedMenuSummaries = MenuList([]);
    for (final menuSummaries in nestedMenuSummaries) {
      if (menuSummaries != null) {
        mergedMenuSummaries.addAll(menuSummaries);
      } else {
        mergedMenuSummaries.add(null);
      }
    }
    return mergedMenuSummaries;
  }

  List<DateSplitMenuList?> createDateSplit() {
    final dateSplitDateMenuList = <DateSplitMenuList?>[];
    DateTime? previousMenuDate;
    var menus = const <MenuSummary>[];
    forEachIndexed((index, menu) {
      if (menu == null) {
        dateSplitDateMenuList.add(null);
      } else if (previousMenuDate?.isSameDay(menu.date) == true) {
        menus = menus + [menu];
      } else {
        if (previousMenuDate != null) {
          dateSplitDateMenuList.add(DateSplitMenuList(date: previousMenuDate!, menus: menus));
        }
        previousMenuDate = menu.date;
        menus = [menu];
      }
    });
    if (previousMenuDate != null) {
      dateSplitDateMenuList.add(DateSplitMenuList(date: previousMenuDate!, menus: menus));
    }
    return dateSplitDateMenuList;
  }
}
