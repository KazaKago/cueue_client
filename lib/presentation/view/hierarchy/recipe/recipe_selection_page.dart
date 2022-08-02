import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/global/widget/shimmer_container.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_list_widget.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_loading_item.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipeSelectionPage extends HookConsumerWidget {
  const RecipeSelectionPage(this._initialSelectedRecipes, {super.key});

  final List<RecipeSummary> _initialSelectedRecipes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRecipes = useState<List<RecipeSummary>>(_initialSelectedRecipes);
    final state = ref.watch(recipeSelectionViewModelProvider.select((viewModel) => viewModel.state));
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(selectedRecipes.value);
        return false;
      },
      child: state.when(
        loading: () => _buildLoading(context, ref),
        completed: (recipes) => _buildCompleted(context, recipes, selectedRecipes),
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

  Widget _buildCompleted(BuildContext context, List<Tag> tags, ValueNotifier<List<RecipeSummary>> selectedRecipes) {
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
          children: [RecipeListWidget(key: const PageStorageKey(-1), selectedRecipes: selectedRecipes.value, onTap: (recipe) => _onCheckChanged(selectedRecipes, recipe))] +
              tags.map((tag) {
                return RecipeListWidget(key: PageStorageKey(tag.id.value), tagIds: List.filled(1, tag.id), selectedRecipes: selectedRecipes.value, onTap: (recipe) => _onCheckChanged(selectedRecipes, recipe));
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, WidgetRef ref, Exception exception) {
    final viewModel = ref.read(recipeSelectionViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(intl(context).selectRecipes),
      ),
      body: ErrorHandlingWidget(exception, onClickRetry: viewModel.retry),
    );
  }

  Future<void> _onCheckChanged(ValueNotifier<List<RecipeSummary>> selectedRecipes, RecipeSummary recipe) async {
    final localSelectedRecipes = selectedRecipes.value.toList();
    if (localSelectedRecipes.map((e) => e.id).contains(recipe.id)) {
      localSelectedRecipes.removeWhere((element) => element.id == recipe.id);
    } else {
      localSelectedRecipes.add(recipe);
    }
    selectedRecipes.value = localSelectedRecipes;
  }
}
