import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/legacy/presentation/view/global/l10n/intl.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:cueue/model/tag/tag_id.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_detail_page.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_list.dart';
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
    final pushPage = usePushPage<void>();
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(selectedRecipes?.value);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(intl(context).searchResultOf(keyword)),
        ),
        body: RecipeList(
          keyword: keyword,
          tagIds: tagIds,
          selectedRecipes: selectedRecipes?.value,
          onTap: (recipe) {
            if (selectedRecipes != null) {
              _onCheckChanged(selectedRecipes, recipe);
            } else {
              pushPage.trigger(RecipeDetailPage(recipe));
            }
          },
        ),
      ),
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
