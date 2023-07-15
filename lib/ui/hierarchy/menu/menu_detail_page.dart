import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/hooks/global/utils/use_date_format.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/global/utils/use_theme.dart';
import 'package:cueue/hooks/hierarchy/menu/use_menu.dart';
import 'package:cueue/hooks/hierarchy/menu/use_timeframe_formatter.dart';
import 'package:cueue/model/menu/menu.dart';
import 'package:cueue/model/menu/menu_id.dart';
import 'package:cueue/model/menu/menu_summary.dart';
import 'package:cueue/ui/global/widget/default_state_widget.dart';
import 'package:cueue/ui/global/widget/titled_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuDetailPage extends HookConsumerWidget {
  const MenuDetailPage({super.key, required this.menuId, this.menuSummary});

  final MenuId menuId;
  final MenuSummary? menuSummary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = useIntl();
    final goNamed = useGoNamed();
    final toDateString = useToDateString();
    final toFormattedString = useToFormattedString();
    final menuState = useMenu(ref, menuId);
    final menu = menuState.data;
    final date = menuState.data?.date ?? menuSummary?.date;
    final timeFrame = menuState.data?.timeFrame ?? menuSummary?.timeFrame;
    return Scaffold(
      appBar: AppBar(
        title: Text('${(date != null) ? toDateString(date) : ''} ${(timeFrame != null) ? toFormattedString(timeFrame) : ''}'),
        actions: [
          if (menu != null)
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: intl.doEdit,
              onPressed: () => goNamed.trigger(GoName('menu_editing', pathParameters: {'menu_id': menu.id.value.toString()}, extra: menu)),
            ),
        ],
      ),
      body: DefaultStateWidget<Menu>(
        state: menuState,
        loadingChild: () => _buildContent(ref),
        errorChild: (_) => _buildContent(ref),
        child: (menu) => _buildContent(ref),
      ),
    );
  }

  Widget _buildContent(WidgetRef ref) {
    final menuState = useMenu(ref, menuId);
    final menu = menuState.data ?? menuSummary;
    return RefreshIndicator(
      onRefresh: () => menuState.mutate(null),
      child: ListView(
        children: [
          if (menu != null) _buildMenuItem(menu),
          if (menu != null) _buildMemoItem(menu),
        ],
      ),
    );
  }

  Widget _buildMenuItem(MenuSummary menu) {
    final intl = useIntl();
    final theme = useTheme();
    final goNamed = useGoNamed();
    return TitledCard.list(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      title: intl.cookingMenu,
      contentPadding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
      children: menu.recipes.map((recipe) {
        final image = recipe.image;
        return ListTile(
          leading: (image != null)
              ? CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(image.url.toString()),
                )
              : CircleAvatar(
                  backgroundColor: theme.dividerColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Assets.images.icAppIcon.image(color: theme.hoverColor),
                  ),
                ),
          title: Text(recipe.title),
          onTap: () => goNamed.trigger(GoName('recipe_detail', pathParameters: {'recipe_id': recipe.id.value.toString()}, extra: recipe)),
        );
      }).toList(),
    );
  }

  Widget _buildMemoItem(MenuSummary menu) {
    final intl = useIntl();
    return TitledCard(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      title: intl.memo,
      child: Text(menu.memo),
    );
  }
}
