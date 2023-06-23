import 'package:cueue/hooks/hierarchy/tag/use_tags.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
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
    final intl = useIntl();
    final tagsState = useTags(ref);
    final tags = tagsState.data;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(selectedRecipes.value);
        return false;
      },
      child: DefaultTabController(
        length: (tags != null) ? tags.length + 1 : 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text(intl.selectRecipes),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                if (tags != null) Tab(text: intl.allRecipes),
                if (tags != null)
                  for (final tag in tags) Tab(text: tag.name),
              ],
            ),
          ),
          body: _buildContent(ref, selectedRecipes),
        ),
      ),
    );
  }

  Widget _buildContent(WidgetRef ref, ValueNotifier<List<RecipeSummary>> selectedRecipes) {
    final tagsState = useTags(ref);
    final error = tagsState.error;
    final tags = tagsState.data;
    if (error != null) {
      return ErrorHandlingWidget(error);
    } else if (tags == null) {
      return const RecipeLoading();
    } else {
      return TabBarView(
        children: [
          RecipeList(key: const PageStorageKey(-1), selectedRecipes: selectedRecipes.value, onTap: (recipe) => _onCheckChanged(selectedRecipes, recipe)),
          for (final tag in tags) RecipeList(key: PageStorageKey(tag.id.value), tagIds: List.filled(1, tag.id), selectedRecipes: selectedRecipes.value, onTap: (recipe) => _onCheckChanged(selectedRecipes, recipe)),
        ],
      );
    }
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
