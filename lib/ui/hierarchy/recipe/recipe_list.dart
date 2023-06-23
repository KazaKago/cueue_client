import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_reach_bottom.dart';
import 'package:cueue/hooks/hierarchy/recipe/use_recipes.dart';
import 'package:cueue/model/recipe/recipe_search_option.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:cueue/model/tag/tag_id.dart';
import 'package:cueue/ui/global/widget/empty_widget.dart';
import 'package:cueue/ui/global/widget/loading_list_item.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_item.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipeList extends HookConsumerWidget {
  factory RecipeList({
    String? keyword,
    List<TagId>? tagIds,
    List<RecipeSummary>? selectedRecipes,
    void Function(RecipeSummary recipe)? onTap,
    bool fabPadding = false,
    Key? key,
  }) {
    return RecipeList._(RecipeSearchOption(keyword: keyword, tagIds: tagIds), selectedRecipes, onTap, fabPadding, key);
  }

  const RecipeList._(this._recipeSearchOption, this._selectedRecipes, this._onTap, this._fabPadding, Key? key) : super(key: key);

  final RecipeSearchOption _recipeSearchOption;
  final List<RecipeSummary>? _selectedRecipes;
  final void Function(RecipeSummary recipe)? _onTap;
  final bool _fabPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesState = useRecipes(ref, recipeSearchOption: _recipeSearchOption);
    final scrollController = useScrollController();
    useReachBottom(scrollController, () {
      if (!recipesState.isValidating) {
        recipesState.setSize(recipesState.size + 1); // FIXME: fix crash
      }
    });
    final recipesList = recipesState.data;
    final error = recipesState.error;
    if (error != null) {
      final intl = useIntl();
      return EmptyWidget(intl.noRecipeMessage);
    } else if (recipesList == null) {
      return const RecipeLoading();
    } else {
      return RefreshIndicator(
        onRefresh: () => recipesState.mutate(null),
        child: _buildContent(scrollController, recipesList),
      );
    }
  }

  Widget _buildContent(ScrollController scrollController, List<List<RecipeSummary>?> recipesList) {
    return Scrollbar(
      controller: scrollController,
      child: ListView.builder(
        padding: _fabPadding ? const EdgeInsets.only(bottom: 70) : null,
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: recipesList.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(recipesList[index]);
        },
      ),
    );
  }

  Widget _buildItem(List<RecipeSummary>? recipes) {
    if (recipes == null) {
      return const LoadingListItem();
    } else {
      return Column(
        children: recipes.map((recipe) {
          final isCheck = _selectedRecipes?.map((e) => e.id).contains(recipe.id);
          return RecipeItem(
            recipe: recipe,
            isCheck: isCheck,
            onTap: () => _onTap?.call(recipe),
          );
        }).toList(),
      );
    }
  }
}
