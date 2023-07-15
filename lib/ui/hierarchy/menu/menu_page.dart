import 'package:cueue/hooks/global/utils/use_date_format.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_reach_bottom.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/global/utils/use_theme.dart';
import 'package:cueue/hooks/hierarchy/menu/use_menus.dart';
import 'package:cueue/hooks/hierarchy/menu/use_timeframe_formatter.dart';
import 'package:cueue/model/color/color_extension.dart';
import 'package:cueue/model/date/date_time_extension.dart';
import 'package:cueue/model/menu/date_split_menu_list.dart';
import 'package:cueue/model/menu/menu_list.dart';
import 'package:cueue/ui/global/widget/empty_widget.dart';
import 'package:cueue/ui/global/widget/loading_list_item.dart';
import 'package:cueue/ui/hierarchy/menu/menu_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuPage extends HookConsumerWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = useIntl();
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.cookingMenu),
      ),
      body: _buildContent(ref),
    );
  }

  Widget _buildContent(WidgetRef ref) {
    final menusState = useMenus(ref);
    final scrollController = useScrollController();
    useReachBottom(scrollController, () {
      if (!menusState.isValidating) {
        menusState.setSize(menusState.size + 1); // FIXME: fix crash
      }
    });
    final menus = menusState.data;
    final error = menusState.error;
    if (error != null) {
      final intl = useIntl();
      return EmptyWidget(intl.noMenuMessage);
    } else if (menus == null) {
      return const MenuLoading();
    } else {
      return RefreshIndicator(
        onRefresh: () => menusState.mutate(null),
        child: Scrollbar(
          controller: scrollController,
          child: CustomScrollView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: _buildSliverList(ref, MenuList.from(menus).createDateSplit()) + [SliverStickyHeader(sticky: false, header: const SizedBox(height: 70))],
          ),
        ),
      );
    }
  }

  List<SliverStickyHeader> _buildSliverList(WidgetRef ref, List<DateSplitMenuList?> menus) {
    final intl = useIntl();
    final theme = useTheme();
    final goNamed = useGoNamed();
    final toDateString = useToDateString();
    final toFormattedString = useToFormattedString();
    final toFormattedImage = useToFormattedImage();
    return menus.map((dateSplitMenus) {
      if (dateSplitMenus != null) {
        return SliverStickyHeader(
          header: ColoredBox(
            color: _backgroundColor(theme, dateSplitMenus.date),
            child: ListTile(
              title: Row(
                children: [
                  if (dateSplitMenus.date.isToday()) Text(intl.today, style: theme.textTheme.titleMedium!.copyWith(color: Colors.blue.shade600, fontWeight: FontWeight.bold)),
                  if (dateSplitMenus.date.isTomorrow()) Text(intl.tomorrow, style: theme.textTheme.titleMedium!.copyWith(color: Colors.blue.shade300, fontWeight: FontWeight.bold)),
                  if (dateSplitMenus.date.isDayAfterTomorrow()) Text(intl.dayAfterTomorrow, style: theme.textTheme.titleMedium!.copyWith(color: Colors.blue.shade200, fontWeight: FontWeight.bold)),
                  if (dateSplitMenus.date.isToday() || dateSplitMenus.date.isTomorrow() || dateSplitMenus.date.isDayAfterTomorrow()) const SizedBox(width: 16),
                  Text(toDateString(dateSplitMenus.date), style: theme.textTheme.titleMedium),
                ],
              ),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => Ink(
                color: _backgroundColor(theme, dateSplitMenus.date),
                child: ListTile(
                  leading: CircleAvatar(backgroundImage: toFormattedImage(dateSplitMenus.menus[i].timeFrame).image, backgroundColor: Colors.transparent),
                  title: Text(dateSplitMenus.menus[i].recipes.map((e) => e.title).join(',')),
                  subtitle: Text(dateSplitMenus.menus[i].memo.isNotEmpty ? intl.withMemo(dateSplitMenus.menus[i].memo) : toFormattedString(dateSplitMenus.menus[i].timeFrame), maxLines: 2, overflow: TextOverflow.ellipsis),
                  onTap: () {
                    final menu = dateSplitMenus.menus[i];
                    goNamed.trigger(GoName('menu_detail', pathParameters: {'menu_id': menu.id.value.toString()}, extra: menu));
                  },
                ),
              ),
              childCount: dateSplitMenus.menus.length,
            ),
          ),
        );
      } else {
        return SliverStickyHeader(sticky: false, header: const LoadingListItem());
      }
    }).toList();
  }

  Color _backgroundColor(ThemeData theme, DateTime dateTime) {
    final isToday = dateTime.isToday();
    if (isToday) {
      final color = theme.colorScheme.primary;
      switch (theme.brightness) {
        case Brightness.dark:
          return color.blacker(0.6);
        case Brightness.light:
          return color.whiter(0.8);
      }
    } else {
      return theme.scaffoldBackgroundColor;
    }
  }
}
