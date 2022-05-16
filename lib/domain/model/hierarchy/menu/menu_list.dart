import 'package:collection/collection.dart';
import 'package:cueue/domain/model/hierarchy/date/date_time_extension.dart';
import 'package:cueue/domain/model/hierarchy/menu/date_split_menu_list.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_summary.dart';

class MenuList extends DelegatingList<MenuSummary> {
  MenuList(super.base);

  List<DateSplitMenuList> createDateSplit() {
    final dateSplitDateMenuList = <DateSplitMenuList>[];
    DateTime? menuDate;
    var menus = const <MenuSummary>[];
    forEachIndexed((index, menu) {
      final date = menuDate;
      if (date == null) {
        menuDate = menu.date;
        menus = [menu];
      } else if (date.isSameDay(menu.date)) {
        menus = menus + [menu];
      } else {
        dateSplitDateMenuList.add(DateSplitMenuList(date: date, menus: menus));
        menuDate = menu.date;
        menus = [menu];
      }
    });
    if (menuDate != null) {
      dateSplitDateMenuList.add(DateSplitMenuList(date: menuDate!, menus: menus));
    }
    return dateSplitDateMenuList;
  }
}
