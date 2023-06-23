import 'package:cueue/legacy/domain/usecase/di/usecase_provider.dart';
import 'package:cueue/legacy/presentation/viewmodel/hierarchy/recipe/recipe_selection_viewmodel.dart';
import 'package:cueue/legacy/presentation/viewmodel/hierarchy/recipe/recipe_viewmodel.dart';
import 'package:cueue/model/recipe/recipe_search_option.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final recipeViewModelProvider = ChangeNotifierProvider.autoDispose.family<RecipeViewModel, RecipeSearchOption?>((ref, searchOption) => RecipeViewModel(ref.read(followAllRecipesUseCaseProvider), ref.read(refreshAllRecipesUseCaseProvider), ref.read(requestAdditionalAllRecipesUseCaseProvider), searchOption ?? RecipeSearchOption()));
final recipeSelectionViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => RecipeSelectionViewModel(ref.read(followTagsUseCaseProvider), ref.read(refreshTagsUseCaseProvider)));
