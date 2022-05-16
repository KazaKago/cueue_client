import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/global/widget/shimmer_container.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_detail_page.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_list_widget.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_loading_item.dart';
import 'package:cueue/presentation/view/hierarchy/tag/tag_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipePage extends HookConsumerWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tagViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: () => _buildLoading(context, ref),
      empty: () => _buildCompleted(context, ref, List.empty()),
      completed: (tags) => _buildCompleted(context, ref, tags),
      error: (exception) => _buildError(context, ref, exception),
    );
  }

  Widget _buildLoading(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl(context).recipe),
        actions: <Widget>[
          IconButton(
            icon: const Icon(FontAwesomeIcons.tag),
            tooltip: intl(context).tag,
            onPressed: () => _goTag(context),
          ),
        ],
      ),
      body: ShimmerContainer(
        child: Wrap(
          children: List.filled(10, const RecipeLoadingItem()),
        ),
      ),
    );
  }

  Widget _buildCompleted(BuildContext context, WidgetRef ref, List<Tag> tags) {
    return DefaultTabController(
      length: tags.length + 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(intl(context).recipe),
          actions: <Widget>[
            IconButton(
              icon: const Icon(FontAwesomeIcons.tag),
              tooltip: intl(context).tag,
              onPressed: () => _goTag(context),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: [Tab(text: intl(context).allRecipes)] + tags.map((tag) => Tab(text: tag.name)).toList(),
          ),
        ),
        body: TabBarView(
          children: [RecipeListWidget(key: const PageStorageKey(-1), onTap: (recipe) => _goRecipeDetail(context, recipe), fabPadding: true)] +
              tags.map((tag) {
                return RecipeListWidget(key: PageStorageKey(tag.id.value), tagIds: List.filled(1, tag.id), onTap: (recipe) => _goRecipeDetail(context, recipe), fabPadding: true);
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, WidgetRef ref, Exception exception) {
    final viewModel = ref.read(tagViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(intl(context).recipe),
        actions: <Widget>[
          IconButton(
            icon: const Icon(FontAwesomeIcons.tag),
            tooltip: intl(context).tag,
            onPressed: () => _goTag(context),
          ),
        ],
      ),
      body: ErrorHandlingWidget(exception, onClickRetry: viewModel.retry),
    );
  }

  Future<void> _goRecipeDetail(BuildContext context, RecipeSummary recipe) async {
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => RecipeDetailPage(recipe)));
  }

  Future<void> _goTag(BuildContext context) async {
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => const TagPage()));
  }
}
