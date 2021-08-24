import 'package:cueue/domain/model/hierarchy/date/date_time_extension.dart';
import 'package:cueue/domain/model/hierarchy/menu/date_split_menu_list.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class MenuList extends DelegatingList<MenuSummary> {
  MenuList(final List<MenuSummary> base) : super(base);

  List<DateSplitMenuList> createDateSplit() {
    final dateSplitDateMenuList = <DateSplitMenuList>[];
    DateSplitMenuList? dateSplitDateMenu;
    forEach((menu) {
      if (dateSplitDateMenu == null) {
        dateSplitDateMenu = DateSplitMenuList(date: menu.date, menus: []);
        dateSplitDateMenu!.menus.add(menu);
      } else if (dateSplitDateMenu!.date.isSameDay(menu.date)) {
        dateSplitDateMenu!.menus.add(menu);
      } else {
        dateSplitDateMenuList.add(dateSplitDateMenu!);
        dateSplitDateMenu = DateSplitMenuList(date: menu.date, menus: []);
        dateSplitDateMenu!.menus.add(menu);
      }
    });
    if (dateSplitDateMenu != null) dateSplitDateMenuList.add(dateSplitDateMenu!);
    return dateSplitDateMenuList;
  }
}
