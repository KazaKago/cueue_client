import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/model/content/content.dart';
import 'package:cueue/model/content/content_key.dart';
import 'package:cueue/model/recipe/recipe.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:cueue/model/recipe/recipe_summary_impl.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/model/tag/tag_id.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_detail_page.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_editing_page.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_loading.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_page.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_selection_page.dart';
import 'package:widgetbook/widgetbook.dart';

final recipeComponent = WidgetbookComponent(
  name: 'Recipe',
  useCases: [
    WidgetbookUseCase(
      name: 'RecipePage',
      builder: (_) => const RecipePage(),
    ),
    WidgetbookUseCase(
      name: 'RecipeDetailPage',
      builder: (_) => RecipeDetailPage(
        RecipeSummaryImpl(
          id: const RecipeId(0),
          title: 'recipe title',
          image: Content(
            key: const ContentKey('key'),
            url: Uri.parse(Assets.images.time1Asa.path),
          ),
          lastCookingAt: DateTime.now(),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'RecipeEditingPage',
      builder: (_) => RecipeEditingPage(
        recipe: Recipe(
          id: const RecipeId(0),
          title: 'recipe title',
          description: 'recipe description',
          url: Uri.parse('https://google.com'),
          images: [
            Content(
              key: const ContentKey('key 1'),
              url: Uri.parse(Assets.images.time1Asa.path),
            ),
            Content(
              key: const ContentKey('key 2'),
              url: Uri.parse(Assets.images.time2Hiru.path),
            ),
          ],
          cookingCount: 10,
          cookingHistories: [
            DateTime.now(),
            DateTime.now(),
            DateTime.now(),
          ],
          tags: [
            const Tag(id: TagId(0), name: 'tag 1'),
            const Tag(id: TagId(1), name: 'tag 2'),
            const Tag(id: TagId(2), name: 'tag 3'),
          ],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'RecipeSelectionPage',
      builder: (_) => const RecipeSelectionPage([]),
    ),
    WidgetbookUseCase(
      name: 'RecipeLoading',
      builder: (_) => const RecipeLoading(),
    ),
  ],
);
