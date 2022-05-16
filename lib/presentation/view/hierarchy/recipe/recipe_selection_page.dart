import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/global/widget/shimmer_container.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_list_widget.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_loading_item.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipeSelectionPage extends HookConsumerWidget {
  const RecipeSelectionPage(this.recipes, {super.key});

  final List<RecipeSummary> recipes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recipeSelectionViewModelProvider(recipes).select((viewModel) => viewModel.state));
    final viewModel = ref.read(recipeSelectionViewModelProvider(recipes));
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(viewModel.selectedRecipes);
        return false;
      },
      child: state.when(
        loading: () => _buildLoading(context, ref),
        completed: (recipes) => _buildCompleted(context, ref, recipes),
        error: (exception) => _buildError(context, ref, exception),
      ),
    );
  }

  Widget _buildLoading(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl(context).selectRecipes),
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
          title: Text(intl(context).selectRecipes),
          bottom: TabBar(
            isScrollable: true,
            tabs: [Tab(text: intl(context).allRecipes)] + tags.map((tag) => Tab(text: tag.name)).toList(),
          ),
        ),
        body: TabBarView(
          children: [RecipeListWidget(key: const PageStorageKey(-1), selectedRecipes: recipes, onTap: (recipe) => _onCheckChanged(ref, recipe))] +
              tags.map((tag) {
                return RecipeListWidget(key: PageStorageKey(tag.id.value), tagIds: List.filled(1, tag.id), selectedRecipes: recipes, onTap: (recipe) => _onCheckChanged(ref, recipe));
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, WidgetRef ref, Exception exception) {
    final viewModel = ref.read(recipeSelectionViewModelProvider(recipes));
    return Scaffold(
      appBar: AppBar(
        title: Text(intl(context).selectRecipes),
      ),
      body: ErrorHandlingWidget(exception, onClickRetry: viewModel.retry),
    );
  }

  Future<void> _onCheckChanged(WidgetRef ref, RecipeSummary recipe) async {
    final viewModel = ref.read(recipeSelectionViewModelProvider(recipes));
    final selectedRecipes = viewModel.selectedRecipes.toList();
    if (selectedRecipes.map((e) => e.id).contains(recipe.id)) {
      selectedRecipes.removeWhere((element) => element.id == recipe.id);
    } else {
      selectedRecipes.add(recipe);
    }
    viewModel.selectedRecipes = selectedRecipes;
  }
}
