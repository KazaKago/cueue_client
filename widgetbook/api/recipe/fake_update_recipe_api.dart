import 'package:cueue/api/hierarchy/recipe/create_recipe_api.dart';
import 'package:cueue/api/hierarchy/recipe/delete_recipe_api.dart';
import 'package:cueue/api/hierarchy/recipe/get_recipe_api.dart';
import 'package:cueue/api/hierarchy/recipe/get_recipes_api.dart';
import 'package:cueue/api/hierarchy/recipe/update_recipe_api.dart';
import 'package:cueue/api/request/recipe/recipe_request.dart';
import 'package:cueue/api/response/content/content_response.dart';
import 'package:cueue/api/response/recipe/recipe_response.dart';
import 'package:cueue/api/response/recipe/recipe_summary_response.dart';
import 'package:cueue/api/response/tag/tag_response.dart';
import 'package:cueue/gen/assets.gen.dart';

class FakeUpdateRecipeApi implements UpdateRecipeApi {
  const FakeUpdateRecipeApi();

  @override
  Future<RecipeResponse> call(int recipeId, RecipeRequest request) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return RecipeResponse(
      id: 0,
      title: 'recipe title',
      description: 'recipe description',
      url: 'https://google.com',
      images: [
        ContentResponse(
          key: 'key 1',
          url: Assets.images.time1Asa.path,
        ),
        ContentResponse(
          key: 'key 2',
          url: Assets.images.time2Hiru.path,
        ),
        ContentResponse(
          key: 'key 3',
          url: Assets.images.time3Yuu.path,
        ),
        ContentResponse(
          key: 'key 4',
          url: Assets.images.time4Yoru.path,
        ),
      ],
      tags: const [
        TagResponse(
          id: 0,
          name: 'tag 1',
        ),
        TagResponse(
          id: 1,
          name: 'tag 2',
        ),
        TagResponse(
          id: 2,
          name: 'tag 3',
        ),
      ],
      cookingHistories: [
        '2012-02-27 13:27:00',
        '2012-02-27 13:27:00',
        '2012-02-27 13:27:00',
      ],
      cookingCount: 5,
      createdAt: '2012-02-27 13:27:00',
      updatedAt: '2012-02-27 13:27:00',
    );
  }
}
