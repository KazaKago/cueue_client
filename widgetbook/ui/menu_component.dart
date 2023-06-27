import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/model/content/content.dart';
import 'package:cueue/model/content/content_key.dart';
import 'package:cueue/model/menu/menu.dart';
import 'package:cueue/model/menu/menu_id.dart';
import 'package:cueue/model/menu/menu_summary_impl.dart';
import 'package:cueue/model/menu/time_frame.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:cueue/model/recipe/recipe_summary_impl.dart';
import 'package:cueue/ui/hierarchy/menu/menu_detail_page.dart';
import 'package:cueue/ui/hierarchy/menu/menu_editing_page.dart';
import 'package:cueue/ui/hierarchy/menu/menu_loading.dart';
import 'package:cueue/ui/hierarchy/menu/menu_page.dart';
import 'package:widgetbook/widgetbook.dart';

final menuComponent = WidgetbookComponent(
  name: 'Menu',
  useCases: [
    WidgetbookUseCase(
      name: 'MenuPage',
      builder: (_) => const MenuPage(),
    ),
    WidgetbookUseCase(
      name: 'MenuDetailPage',
      builder: (_) => MenuDetailPage(
        MenuSummaryImpl(
          id: const MenuId(0),
          memo: 'memo',
          date: DateTime.now(),
          timeFrame: TimeFrame.lunch,
          recipes: [
            RecipeSummaryImpl(
              id: const RecipeId(0),
              title: 'recipe title 1',
              image: Content(
                key: const ContentKey('key 1'),
                url: Uri.parse(Assets.images.time1Asa.path),
              ),
              lastCookingAt: DateTime.now(),
            ),
            RecipeSummaryImpl(
              id: const RecipeId(1),
              title: 'recipe title 2',
              image: Content(
                key: const ContentKey('key 2'),
                url: Uri.parse(Assets.images.time2Hiru.path),
              ),
              lastCookingAt: DateTime.now(),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'MenuEditingPage',
      builder: (_) => MenuEditingPage.withMenu(
        menu: Menu(
          id: const MenuId(0),
          memo: 'memo',
          date: DateTime.now(),
          timeFrame: TimeFrame.lunch,
          recipes: [
            RecipeSummaryImpl(
              id: const RecipeId(0),
              title: 'recipe title 1',
              image: Content(
                key: const ContentKey('key 1'),
                url: Uri.parse(Assets.images.time1Asa.path),
              ),
              lastCookingAt: DateTime.now(),
            ),
            RecipeSummaryImpl(
              id: const RecipeId(1),
              title: 'recipe title 2',
              image: Content(
                key: const ContentKey('key 2'),
                url: Uri.parse(Assets.images.time2Hiru.path),
              ),
              lastCookingAt: DateTime.now(),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'MenuLoading',
      builder: (_) => const MenuLoading(),
    ),
  ],
);
