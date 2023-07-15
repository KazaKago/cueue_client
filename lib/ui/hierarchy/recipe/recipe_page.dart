import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/hierarchy/tag/use_tags.dart';
import 'package:cueue/ui/global/widget/error_handling_widget.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_list.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipePage extends HookConsumerWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = useIntl();
    final goNamed = useGoNamed();
    final tagsState = useTags(ref);
    final tags = tagsState.data;
    return DefaultTabController(
      length: (tags != null) ? tags.length + 1 : 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(intl.recipe),
          actions: <Widget>[
            IconButton(
              icon: const Icon(FontAwesomeIcons.tag),
              tooltip: intl.tag,
              onPressed: () => goNamed.trigger(GoName('tags')),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              if (tags != null) Tab(text: intl.allRecipes),
              if (tags != null)
                for (final tag in tags) Tab(text: tag.name),
            ],
          ),
        ),
        body: _buildContent(ref),
      ),
    );
  }

  Widget _buildContent(WidgetRef ref) {
    final goNamed = useGoNamed();
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
          RecipeList(key: const PageStorageKey(-1), onTap: (recipe) => goNamed.trigger(GoName('recipe_detail', pathParameters: {'recipe_id': recipe.id.value.toString()}, extra: recipe))),
          for (final tag in tags) RecipeList(key: PageStorageKey(tag.id.value), tagIds: List.filled(1, tag.id), onTap: (recipe) => goNamed.trigger(GoName('recipe_detail', pathParameters: {'recipe_id': recipe.id.value.toString()}, extra: recipe)), fabPadding: true),
        ],
      );
    }
  }
}
