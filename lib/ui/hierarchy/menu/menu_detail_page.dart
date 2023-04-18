import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/hooks/global/swr/swr_mutate.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/global/utils/use_theme.dart';
import 'package:cueue/hooks/hierarchy/menu/use_get_menu.dart';
import 'package:cueue/model/edit/editing_result.dart';
import 'package:cueue/model/menu/menu.dart';
import 'package:cueue/model/menu/menu_id.dart';
import 'package:cueue/model/menu/menu_summary.dart';
import 'package:cueue/ui/global/extension/date_time_extension.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:cueue/ui/global/widget/default_state_widget.dart';
import 'package:cueue/ui/global/widget/titled_card.dart';
import 'package:cueue/ui/hierarchy/menu/time_frame_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuDetailPage extends HookConsumerWidget {
  const MenuDetailPage(this.menuSummary, {super.key});

  final MenuSummary menuSummary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = useIntl();
    final toDateString = useToDateString();
    final toFormattedString = useToFormattedString();
    final menuState = useGetMenu(ref, menuSummary.id);
    final menu = menuState.data;
    final pushMenuEditingPage = usePushMenuEditingPage();
    if (pushMenuEditingPage.data == EditingResult.deleted) {
      Navigator.of(context).pop();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('${toDateString(menuSummary.date)} ${toFormattedString(menuSummary.timeFrame)}'),
        actions: [
          if (menu != null)
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: intl.doEdit,
              onPressed: () => pushMenuEditingPage.trigger(menu),
            ),
        ],
      ),
      body: DefaultStateWidget<Menu>(
        state: menuState,
        loadingChild: _buildLoading,
        child: (menu) => _buildContent(menu, menuState.mutate),
      ),
    );
  }

  Widget _buildLoading() {
    return ListView(
      children: [
        _buildMenuItem(menuSummary),
        _buildMemoItem(menuSummary),
      ],
    );
  }

  Widget _buildContent(Menu menu, SWRMutate<MenuId, Menu> mutateMenu) {
    return RefreshIndicator(
      onRefresh: () => mutateMenu(null),
      child: ListView(
        children: [
          _buildMenuItem(menu),
          _buildMemoItem(menu),
        ],
      ),
    );
  }

  Widget _buildMenuItem(MenuSummary menu) {
    final intl = useIntl();
    final theme = useTheme();
    final pushRecipeDetailPage = usePushRecipeDetailPage();
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
          onTap: () => pushRecipeDetailPage.trigger(recipe),
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
