import 'package:cueue/legacy/data/repository/flowable/recipe/recipes_flowable_factory.dart';
import 'package:cueue/legacy/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/model/recipe/recipe_search_option.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:store_flowable/store_flowable.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  const RecipeRepositoryImpl(this._recipesFlowableFactory);

  final RecipesFlowableFactory _recipesFlowableFactory;

  @override
  LoadingStateStream<List<RecipeSummary>> followAllData(RecipeSearchOption searchOption) {
    final recipesFlowable = _recipesFlowableFactory.create(searchOption);
    return recipesFlowable.publish();
  }

  @override
  Future<void> refreshAllData(RecipeSearchOption searchOption) async {
    final recipesFlowable = _recipesFlowableFactory.create(searchOption);
    await recipesFlowable.refresh();
  }

  @override
  Future<void> requestAdditionalAllData(RecipeSearchOption searchOption, {required bool continueWhenError}) async {
    final recipesFlowable = _recipesFlowableFactory.create(searchOption);
    await recipesFlowable.requestNextData(continueWhenError: continueWhenError);
  }
}
