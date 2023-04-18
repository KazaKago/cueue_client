import 'package:cueue/api/hierarchy/menu/get_menus_api.dart';
import 'package:cueue/api/response/content/content_response.dart';
import 'package:cueue/api/response/menu/menu_summary_response.dart';
import 'package:cueue/api/response/recipe/recipe_summary_response.dart';
import 'package:cueue/gen/assets.gen.dart';

class FakeGetMenusApi implements GetMenusApi {
  const FakeGetMenusApi();

  @override
  Future<List<MenuSummaryResponse>> call({int? afterId}) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return [
      MenuSummaryResponse(
        id: 0,
        memo: 'menu memo 1',
        date: '2012-02-27 13:27:00',
        timeFrame: 'breakfast',
        recipes: [
          RecipeSummaryResponse(
            id: 0,
            title: 'recipe title 1',
            image: ContentResponse(
              key: 'key 1',
              url: Assets.images.time1Asa.path,
            ),
            lastCookingAt: '2012-02-27 13:27:00',
          ),
          RecipeSummaryResponse(
            id: 1,
            title: 'recipe title 2',
            image: ContentResponse(
              key: 'key 2',
              url: Assets.images.time2Hiru.path,
            ),
            lastCookingAt: '2012-02-27 13:27:00',
          ),
          RecipeSummaryResponse(
            id: 2,
            title: 'recipe title 3',
            image: ContentResponse(
              key: 'key 3',
              url: Assets.images.time3Yuu.path,
            ),
            lastCookingAt: '2012-02-27 13:27:00',
          ),
          RecipeSummaryResponse(
            id: 3,
            title: 'recipe title 4',
            image: ContentResponse(
              key: 'key 4',
              url: Assets.images.time4Yoru.path,
            ),
            lastCookingAt: '2012-02-27 13:27:00',
          ),
        ],
      ),
      MenuSummaryResponse(
        id: 1,
        memo: 'menu memo 2',
        date: '2012-02-27 13:27:00',
        timeFrame: 'lunch',
        recipes: [
          RecipeSummaryResponse(
            id: 0,
            title: 'recipe title 1',
            image: ContentResponse(
              key: 'key 1',
              url: Assets.images.time1Asa.path,
            ),
            lastCookingAt: '2012-02-27 13:27:00',
          ),
          RecipeSummaryResponse(
            id: 1,
            title: 'recipe title 2',
            image: ContentResponse(
              key: 'key 2',
              url: Assets.images.time2Hiru.path,
            ),
            lastCookingAt: '2012-02-27 13:27:00',
          ),
          RecipeSummaryResponse(
            id: 2,
            title: 'recipe title 3',
            image: ContentResponse(
              key: 'key 3',
              url: Assets.images.time3Yuu.path,
            ),
            lastCookingAt: '2012-02-27 13:27:00',
          ),
          RecipeSummaryResponse(
            id: 3,
            title: 'recipe title 4',
            image: ContentResponse(
              key: 'key 4',
              url: Assets.images.time4Yoru.path,
            ),
            lastCookingAt: '2012-02-27 13:27:00',
          ),
        ],
      ),
      MenuSummaryResponse(
        id: 2,
        memo: 'menu memo 3',
        date: '2012-02-27 13:27:00',
        timeFrame: 'dinner',
        recipes: [
          RecipeSummaryResponse(
            id: 0,
            title: 'recipe title 1',
            image: ContentResponse(
              key: 'key 1',
              url: Assets.images.time1Asa.path,
            ),
            lastCookingAt: '2012-02-27 13:27:00',
          ),
          RecipeSummaryResponse(
            id: 1,
            title: 'recipe title 2',
            image: ContentResponse(
              key: 'key 2',
              url: Assets.images.time2Hiru.path,
            ),
            lastCookingAt: '2012-02-27 13:27:00',
          ),
          RecipeSummaryResponse(
            id: 2,
            title: 'recipe title 3',
            image: ContentResponse(
              key: 'key 3',
              url: Assets.images.time3Yuu.path,
            ),
            lastCookingAt: '2012-02-27 13:27:00',
          ),
          RecipeSummaryResponse(
            id: 3,
            title: 'recipe title 4',
            image: ContentResponse(
              key: 'key 4',
              url: Assets.images.time4Yoru.path,
            ),
            lastCookingAt: '2012-02-27 13:27:00',
          ),
        ],
      ),
    ];
  }
}
