import 'package:cueue/domain/model/hierarchy/color/color_extension.dart';
import 'package:cueue/domain/model/hierarchy/date/date_time_extension.dart';
import 'package:cueue/domain/model/hierarchy/menu/date_split_menu_list.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_summary.dart';
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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuPage extends HookConsumerWidget {
  const MenuPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final state = ref.watch(menuViewModelProvider.select((value) => value.state));
    final viewModel = ref.read(menuViewModelProvider);
    final scrollController = useScrollController()..onReachBottomWithAutoDispose(viewModel.requestAddition);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.cookingMenu),
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

  Widget _buildLoading(final BuildContext context, final WidgetRef ref) {
    return ShimmerContainer(
      child: Wrap(
        direction: Axis.horizontal,
        children: List.filled(10, const MenuLoadingItem()),
      ),
    );
  }

  Widget _buildAdditionalLoading(final BuildContext context, final WidgetRef ref, final ScrollController scrollController, final List<DateSplitMenuList> menus) {
    final viewModel = ref.read(menuViewModelProvider);
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: Scrollbar(
        child: CustomScrollView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: _buildSliverList(context, ref, menus) + [SliverStickyHeader(sticky: false, header: const LoadingListItem())],
        ),
      ),
    );
  }

  Widget _buildEmpty(final BuildContext context, final WidgetRef ref) {
    return EmptyWidget(AppLocalizations.of(context)!.no_menu_message);
  }

  Widget _buildCompleted(final BuildContext context, final WidgetRef ref, final ScrollController scrollController, final List<DateSplitMenuList> menus) {
    final viewModel = ref.read(menuViewModelProvider);
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: Scrollbar(
        child: CustomScrollView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: _buildSliverList(context, ref, menus),
        ),
      ),
    );
  }

  Widget _buildError(final BuildContext context, final WidgetRef ref, final Exception exception) {
    final viewModel = ref.read(menuViewModelProvider);
    return ErrorHandlingWidget(exception, onClickRetry: viewModel.retry);
  }

  Widget _buildAdditionalError(final BuildContext context, final WidgetRef ref, final ScrollController scrollController, final List<DateSplitMenuList> menus, final Exception exception) {
    final viewModel = ref.read(menuViewModelProvider);
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: Scrollbar(
        child: CustomScrollView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: _buildSliverList(context, ref, menus) + [SliverStickyHeader(sticky: false, header: ErrorListItem(exception, onClickRetry: viewModel.retryAddition))],
        ),
      ),
    );
  }

  List<SliverStickyHeader> _buildSliverList(final BuildContext context, final WidgetRef ref, final List<DateSplitMenuList> menus) {
    return menus.map((dateSplitMenus) {
      return SliverStickyHeader(
        header: Container(
          color: _backgroundColor(context, dateSplitMenus.date),
          child: ListTile(
            title: Row(children: [
              if (dateSplitMenus.date.isToday()) Text(AppLocalizations.of(context)!.today, style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.blue.shade600, fontWeight: FontWeight.bold)),
              if (dateSplitMenus.date.isTomorrow()) Text(AppLocalizations.of(context)!.tomorrow, style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.blue.shade300, fontWeight: FontWeight.bold)),
              if (dateSplitMenus.date.isDayAfterTomorrow()) Text(AppLocalizations.of(context)!.dayAfterTomorrow, style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.blue.shade200, fontWeight: FontWeight.bold)),
              if (dateSplitMenus.date.isToday() || dateSplitMenus.date.isTomorrow() || dateSplitMenus.date.isDayAfterTomorrow()) const SizedBox(width: 16),
              Text(dateSplitMenus.date.toDateString(context), style: Theme.of(context).textTheme.subtitle1),
            ]),
          ),
        ),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) => Ink(
              color: _backgroundColor(context, dateSplitMenus.date),
              child: ListTile(
                leading: CircleAvatar(backgroundImage: dateSplitMenus.menus[i].timeFrame.toFormattedImage().image),
                title: Text(dateSplitMenus.menus[i].recipes.map((e) => e.title).join(',')),
                subtitle: Text(dateSplitMenus.menus[i].memo.isNotEmpty ? AppLocalizations.of(context)!.withMemo(dateSplitMenus.menus[i].memo) : dateSplitMenus.menus[i].timeFrame.toFormattedString(context), maxLines: 2, overflow: TextOverflow.ellipsis),
                onTap: () => _goMenuDetail(context, dateSplitMenus.menus[i]),
              ),
            ),
            childCount: dateSplitMenus.menus.length,
          ),
        ),
      );
    }).toList();
  }

  Future<void> _goMenuDetail(final BuildContext context, final MenuSummary menu) async {
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => MenuDetailPage(menu)));
  }

  Color _backgroundColor(final BuildContext context, final DateTime dateTime) {
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
