import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/global/widget/shimmer_container.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_detail_page.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_list_widget.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_loading_item.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipePage extends HookConsumerWidget {
  const RecipePage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final state = ref.watch(tagViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: () => _buildLoading(context, ref),
      completed: (tags) => _buildCompleted(context, ref, tags),
      error: (exception) => _buildError(context, ref, exception),
    );
  }

  Widget _buildLoading(final BuildContext context, final WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.recipe),
      ),
      body: ShimmerContainer(
        child: Wrap(
          direction: Axis.horizontal,
          children: List.filled(10, const RecipeLoadingItem()),
        ),
      ),
    );
  }

  Widget _buildCompleted(final BuildContext context, final WidgetRef ref, final List<Tag> tags) {
    return DefaultTabController(
      length: tags.length + 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.recipe),
          bottom: TabBar(
            isScrollable: true,
            tabs: [Tab(text: AppLocalizations.of(context)!.allRecipes)] + tags.map((tag) => Tab(text: tag.name)).toList(),
          ),
        ),
        body: TabBarView(
          children: [RecipeListWidget(key: const PageStorageKey(-1), onTap: (recipe) => _goRecipeDetail(context, recipe))] +
              tags.map((tag) {
                return RecipeListWidget(key: PageStorageKey(tag.id.value), tag: tag, onTap: (recipe) => _goRecipeDetail(context, recipe));
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildError(final BuildContext context, final WidgetRef ref, final Exception exception) {
    final viewModel = ref.read(tagViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.recipe),
      ),
      body: ErrorHandlingWidget(exception, onClickRetry: viewModel.retry),
    );
  }

  Future<void> _goRecipeDetail(final BuildContext context, final RecipeSummary recipe) async {
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => RecipeDetailPage(recipe)));
  }
}
