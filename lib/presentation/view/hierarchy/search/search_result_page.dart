import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_detail_page.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchResultPage extends HookConsumerWidget {
  const SearchResultPage(this.keyword, this.tagIds, {super.key, this.initialSelectedRecipes});

  final String keyword;
  final List<TagId> tagIds;
  final List<RecipeSummary>? initialSelectedRecipes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRecipes = (initialSelectedRecipes != null) ? useState<List<RecipeSummary>>(initialSelectedRecipes!) : null;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(selectedRecipes?.value);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(intl(context).searchResultOf(keyword)),
        ),
        body: RecipeListWidget(
          keyword: keyword,
          tagIds: tagIds,
          selectedRecipes: selectedRecipes?.value,
          onTap: (recipe) {
            if (selectedRecipes != null) {
              _onCheckChanged(selectedRecipes, recipe);
            } else {
              _goRecipeDetail(context, recipe);
            }
          },
        ),
      ),
    );
  }

  Future<void> _goRecipeDetail(BuildContext context, RecipeSummary recipe) async {
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => RecipeDetailPage(recipe)));
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
