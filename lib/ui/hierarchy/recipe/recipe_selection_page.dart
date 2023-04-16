import 'package:cueue/legacy/presentation/view/global/l10n/intl.dart';
import 'package:cueue/legacy/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/ui/global/widget/error_handling_widget.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_list.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_loading.dart';
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
      body: const RecipeLoading(),
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
            tabs: [
              Tab(text: intl(context).allRecipes),
              for (final tag in tags) Tab(text: tag.name),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RecipeList(key: const PageStorageKey(-1), selectedRecipes: selectedRecipes.value, onTap: (recipe) => _onCheckChanged(selectedRecipes, recipe)),
            for (final tag in tags) RecipeList(key: PageStorageKey(tag.id.value), tagIds: List.filled(1, tag.id), selectedRecipes: selectedRecipes.value, onTap: (recipe) => _onCheckChanged(selectedRecipes, recipe)),
          ],
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