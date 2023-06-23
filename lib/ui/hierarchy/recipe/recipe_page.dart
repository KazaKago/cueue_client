import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/hierarchy/tag/use_tags.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:cueue/ui/global/widget/error_handling_widget.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_detail_page.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_list.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_loading.dart';
import 'package:cueue/ui/hierarchy/tag/tag_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipePage extends HookConsumerWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = useIntl();
    final pushPage = usePushPage<void>();
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
              onPressed: () => pushPage.trigger(const TagPage()),
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
    final pushPage = usePushPage<void>();
    final tagsState = useTags(ref);
    final error = tagsState.error;
    final tags = tagsState.data;
    if (error != null) {
      return ErrorHandlingWidget(error);
    } else if (tags != null) {
      return TabBarView(
        children: [
          RecipeList(key: const PageStorageKey(-1), onTap: (recipe) => pushPage.trigger(RecipeDetailPage(recipe)), fabPadding: true),
          for (final tag in tags) RecipeList(key: PageStorageKey(tag.id.value), tagIds: List.filled(1, tag.id), onTap: (recipe) => pushPage.trigger(RecipeDetailPage(recipe)), fabPadding: true),
        ],
      );
    } else {
      return const RecipeLoading();
    }
  }
}
