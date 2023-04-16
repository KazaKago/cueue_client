import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/legacy/presentation/view/global/l10n/intl.dart';
import 'package:cueue/legacy/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/model/edit/editing_result.dart';
import 'package:cueue/model/menu/menu.dart';
import 'package:cueue/model/menu/menu_summary.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:cueue/ui/global/extension/date_time_extension.dart';
import 'package:cueue/ui/global/widget/error_handling_widget.dart';
import 'package:cueue/ui/global/widget/titled_card.dart';
import 'package:cueue/ui/hierarchy/menu/menu_editing_page.dart';
import 'package:cueue/ui/hierarchy/menu/time_frame_extension.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuDetailPage extends HookConsumerWidget {
  const MenuDetailPage(this.menu, {super.key});

  final MenuSummary menu;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(menuDetailViewModelProvider(menu.id).select((viewModel) => viewModel.state));
    return state.when(
      loading: () => _buildLoading(context, ref, menu),
      completed: (menu) => _buildCompleted(context, ref, menu),
      error: (exception) => _buildError(context, ref, menu, exception),
    );
  }

  Widget _buildLoading(BuildContext context, WidgetRef ref, MenuSummary menu) {
    final viewModel = ref.read(menuDetailViewModelProvider(menu.id));
    return Scaffold(
      appBar: AppBar(
        title: Text('${menu.date.toDateString(context)} ${menu.timeFrame.toFormattedString(context)}'),
      ),
      body: RefreshIndicator(
        onRefresh: viewModel.refresh,
        child: ListView(
          children: [
            _buildMenuItem(context, ref, menu),
            _buildMemoItem(context, ref, menu),
          ],
        ),
      ),
    );
  }

  Widget _buildCompleted(BuildContext context, WidgetRef ref, Menu menu) {
    final viewModel = ref.read(menuDetailViewModelProvider(menu.id));
    return Scaffold(
      appBar: AppBar(
        title: Text('${menu.date.toDateString(context)} ${menu.timeFrame.toFormattedString(context)}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: intl(context).doEdit,
            onPressed: () => _goMenuEditing(context, menu),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: viewModel.refresh,
        child: ListView(
          children: [
            _buildMenuItem(context, ref, menu),
            _buildMemoItem(context, ref, menu),
          ],
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, WidgetRef ref, MenuSummary menu, Exception exception) {
    final viewModel = ref.read(menuDetailViewModelProvider(menu.id));
    return Scaffold(
      appBar: AppBar(
        title: Text(menu.date.toDateString(context)),
      ),
      body: ErrorHandlingWidget(exception, onClickRetry: viewModel.retry),
    );
  }

  Widget _buildMenuItem(BuildContext context, WidgetRef ref, MenuSummary menu) {
    return TitledCard.list(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      title: intl(context).cookingMenu,
      contentPadding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
      children: menu.recipes.map((recipe) {
        final image = recipe.image;
        return ListTile(
          leading: (image != null)
              ? CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(image.url.toString()),
                )
              : CircleAvatar(
                  backgroundColor: Theme.of(context).dividerColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Assets.images.icAppIcon.image(color: Theme.of(context).hoverColor),
                  ),
                ),
          title: Text(recipe.title),
          onTap: () => _goRecipeDetail(context, recipe),
        );
      }).toList(),
    );
  }

  Widget _buildMemoItem(BuildContext context, WidgetRef ref, MenuSummary menu) {
    return TitledCard(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      title: intl(context).memo,
      child: Text(menu.memo),
    );
  }

  Future<void> _goMenuEditing(BuildContext context, Menu menu) async {
    final result = await Navigator.push<EditingResult>(context, MaterialPageRoute(builder: (context) => MenuEditingPage.withMenu(menu: menu)));
    if (result == EditingResult.deleted) {
      Navigator.of(context).pop();
    }
  }

  Future<void> _goRecipeDetail(BuildContext context, RecipeSummary recipe) async {
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => RecipeDetailPage(recipe)));
  }
}