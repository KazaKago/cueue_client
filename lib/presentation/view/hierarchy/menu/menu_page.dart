import 'package:cueue/domain/model/hierarchy/color/color_extension.dart';
import 'package:cueue/domain/model/hierarchy/date/date_time_extension.dart';
import 'package:cueue/domain/model/hierarchy/menu/date_split_menu_list.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_summary.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/extension/date_time_extension.dart';
import 'package:cueue/presentation/view/global/extension/scroll_controller_extension.dart';
import 'package:cueue/presentation/view/global/widget/empty_widget.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/global/widget/error_list_item.dart';
import 'package:cueue/presentation/view/global/widget/loading_list_item.dart';
import 'package:cueue/presentation/view/global/widget/shimmer_container.dart';
import 'package:cueue/presentation/view/hierarchy/menu/menu_detail_page.dart';
import 'package:cueue/presentation/view/hierarchy/menu/menu_loading_item.dart';
import 'package:cueue/presentation/view/hierarchy/menu/time_frame_extension.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuPage extends HookConsumerWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(menuViewModelProvider.select((value) => value.state));
    final viewModel = ref.read(menuViewModelProvider);
    final scrollController = useScrollController()..onReachBottomWithAutoDispose(viewModel.requestAddition);
    return Scaffold(
      appBar: AppBar(
        title: Text(intl(context).cookingMenu),
      ),
      body: state.when(
        loading: () => _buildLoading(context, ref),
        refreshing: (menus) => _buildCompleted(context, ref, scrollController, menus),
        additionalLoading: (menus) => _buildAdditionalLoading(context, ref, scrollController, menus),
        empty: () => _buildEmpty(context, ref),
        completed: (menus) => _buildCompleted(context, ref, scrollController, menus),
        error: (exception) => _buildError(context, ref, exception),
        additionalError: (menus, exception) => _buildAdditionalError(context, ref, scrollController, menus, exception),
      ),
    );
  }

  Widget _buildLoading(BuildContext context, WidgetRef ref) {
    return ShimmerContainer(
      child: Wrap(
        children: List.filled(10, const MenuLoadingItem()),
      ),
    );
  }

  Widget _buildAdditionalLoading(BuildContext context, WidgetRef ref, ScrollController scrollController, List<DateSplitMenuList> menus) {
    final viewModel = ref.read(menuViewModelProvider);
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: Scrollbar(
        controller: scrollController,
        child: CustomScrollView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: _buildSliverList(context, ref, menus) + [SliverStickyHeader(sticky: false, header: const LoadingListItem()), SliverStickyHeader(sticky: false, header: const SizedBox(height: 70))],
        ),
      ),
    );
  }

  Widget _buildEmpty(BuildContext context, WidgetRef ref) {
    return EmptyWidget(intl(context).noMenuMessage);
  }

  Widget _buildCompleted(BuildContext context, WidgetRef ref, ScrollController scrollController, List<DateSplitMenuList> menus) {
    final viewModel = ref.read(menuViewModelProvider);
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: Scrollbar(
        controller: scrollController,
        child: CustomScrollView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: _buildSliverList(context, ref, menus) + [SliverStickyHeader(sticky: false, header: const SizedBox(height: 70))],
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, WidgetRef ref, Exception exception) {
    final viewModel = ref.read(menuViewModelProvider);
    return ErrorHandlingWidget(exception, onClickRetry: viewModel.retry);
  }

  Widget _buildAdditionalError(BuildContext context, WidgetRef ref, ScrollController scrollController, List<DateSplitMenuList> menus, Exception exception) {
    final viewModel = ref.read(menuViewModelProvider);
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: Scrollbar(
        controller: scrollController,
        child: CustomScrollView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: _buildSliverList(context, ref, menus) + [SliverStickyHeader(sticky: false, header: ErrorListItem(exception, onClickRetry: viewModel.retryAddition)), SliverStickyHeader(sticky: false, header: const SizedBox(height: 70))],
        ),
      ),
    );
  }

  List<SliverStickyHeader> _buildSliverList(BuildContext context, WidgetRef ref, List<DateSplitMenuList> menus) {
    return menus.map((dateSplitMenus) {
      return SliverStickyHeader(
        header: ColoredBox(
          color: _backgroundColor(context, dateSplitMenus.date),
          child: ListTile(
            title: Row(
              children: [
                if (dateSplitMenus.date.isToday()) Text(intl(context).today, style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.blue.shade600, fontWeight: FontWeight.bold)),
                if (dateSplitMenus.date.isTomorrow()) Text(intl(context).tomorrow, style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.blue.shade300, fontWeight: FontWeight.bold)),
                if (dateSplitMenus.date.isDayAfterTomorrow()) Text(intl(context).dayAfterTomorrow, style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.blue.shade200, fontWeight: FontWeight.bold)),
                if (dateSplitMenus.date.isToday() || dateSplitMenus.date.isTomorrow() || dateSplitMenus.date.isDayAfterTomorrow()) const SizedBox(width: 16),
                Text(dateSplitMenus.date.toDateString(context), style: Theme.of(context).textTheme.subtitle1),
              ],
            ),
          ),
        ),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) => Ink(
              color: _backgroundColor(context, dateSplitMenus.date),
              child: ListTile(
                leading: CircleAvatar(backgroundImage: dateSplitMenus.menus[i].timeFrame.toFormattedImage().image, backgroundColor: Colors.transparent),
                title: Text(dateSplitMenus.menus[i].recipes.map((e) => e.title).join(',')),
                subtitle: Text(dateSplitMenus.menus[i].memo.isNotEmpty ? intl(context).withMemo(dateSplitMenus.menus[i].memo) : dateSplitMenus.menus[i].timeFrame.toFormattedString(context), maxLines: 2, overflow: TextOverflow.ellipsis),
                onTap: () => _goMenuDetail(context, dateSplitMenus.menus[i]),
              ),
            ),
            childCount: dateSplitMenus.menus.length,
          ),
        ),
      );
    }).toList();
  }

  Future<void> _goMenuDetail(BuildContext context, MenuSummary menu) async {
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => MenuDetailPage(menu)));
  }

  Color _backgroundColor(BuildContext context, DateTime dateTime) {
    final isToday = dateTime.isToday();
    if (isToday) {
      final color = Theme.of(context).colorScheme.primary;
      switch (Theme.of(context).brightness) {
        case Brightness.dark:
          return color.blacker(0.6);
        case Brightness.light:
          return color.whiter(0.8);
      }
    } else {
      return Theme.of(context).scaffoldBackgroundColor;
    }
  }
}
