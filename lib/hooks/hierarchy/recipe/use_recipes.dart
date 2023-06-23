import 'package:cueue/hooks/global/swr/swr_infinite_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_infinite.dart';
import 'package:cueue/model/recipe/recipe_search_option.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

String? _getKey(int pageIndex, List<RecipeSummary>? previousPageData, RecipeSearchOption? recipeSearchOption) {
  if (previousPageData?.isEmpty == true) {
    return null;
  } else {
    return 'recipes_${recipeSearchOption}_$pageIndex';
  }
}

SWRInfiniteState<String, List<RecipeSummary>> useRecipes(WidgetRef ref, {RecipeSearchOption? recipeSearchOption}) {
  final getRecipesApi = ref.read(getRecipesApiProvider);
  final recipeSummaryResponseMapper = ref.read(recipeSummaryResponseMapperProvider);
  final state = useSWRInfinite<String, List<RecipeSummary>>((pageIndex, previousPageData) => _getKey(pageIndex, previousPageData, recipeSearchOption), (key) async {
    final responses = await getRecipesApi(keyword: recipeSearchOption?.keyword, tagIds: recipeSearchOption?.tagIds?.map((e) => e.value).toList());
    return responses.map(recipeSummaryResponseMapper.call).toList();
  });
  return state;
}
